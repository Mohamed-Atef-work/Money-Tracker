import 'package:sqflite/sqflite.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/data_layout/models/totals_model.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/statistics_layout/repo/statistics_repo.dart';

class StatisticsRepoImpl implements StatisticsRepo {
  final SqfliteServices _services;

  StatisticsRepoImpl(this._services);

  @override
  Future<void> addTotals(AddTotalsParams params) async {
    try {
      for (TotalModel model in params.totalModel) {
        await _services.insertItem(
          tableName: kTotals,
          data: model.toJson(params.expanseMoney),
        );
      }
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }

  Future<void> _addTotal({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await _services.updateItemWithId(
      id: id,
      data: data,
      tableName: kTotals,
    );
  }

  @override
  Future<List<TotalModel>> getTotals() async {
    try {
      final result = await _services.getItems(kTotals);
      final models = result.map((e) => TotalModel.fromJson(e)).toList();
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      print(exc.toString());
      throw exception;
    }
  }

  @override
  Future<List<TotalModel>> getTotalsWithIds(
      GetTotalWithIdsParams params) async {
    try {
      final models = await _getTotalsWithIds(params);
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }

  Future<List<TotalModel>> _getTotalsWithIds(
      GetTotalWithIdsParams params) async {
    final month = await _getOneTotal(params.month, kMonth);
    final monthSide = await _getOneTotal(params.monthSideId, kMonthSide);
    final monthPerson = await _getOneTotal(params.monthPersonId, kMonthPerson);
    final monthPersonSide =
        await _getOneTotal(params.monthPersonSideId, kMonthPersonSide);
    final models = [month, monthSide, monthPerson, monthPersonSide];
    return models;
  }

  Future<TotalModel> _getOneTotal(String id, String idName) async {
    final result = await _services.getItemsWithValue(
      values: [id],
      tableName: kTotals,
      columnsNames: [kId],
    );
    if (result.isNotEmpty) {
      final model = TotalModel.fromJson(result.first);
      return model;
    } else {
      final model = TotalModel.fromNoJson(idName, id);
      return model;
    }
  }
}
