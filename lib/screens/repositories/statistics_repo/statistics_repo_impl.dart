import 'statistics_repo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';

class StatisticsRepoImpl implements StatisticsRepo {
  final SqfliteServices _services;

  StatisticsRepoImpl(this._services);

  @override
  Future<void> addTotals(AddTotalsParams params) async {
    try {
      await _addTotal(params);
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }

  Future<void> _addTotal(AddTotalsParams params) async {
    for (TotalModel model in params.totalModel) {
      await _services.insertItem(
        tableName: kTotals,
        data: model.toJson(params.expanseMoney),
      );
    }
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
  Future<List<TotalModel>> getTotalsBeforeAddingExpanse(
      GetTotalWithIdsParams params) async {
    try {
      final models = await _getTotalsBeforeAddingExpanse(params);
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      print("error is -------->$exc");
      throw exception;
    }
  }

  Future<List<TotalModel>> _getTotalsBeforeAddingExpanse(
      GetTotalWithIdsParams params) async {
    final result = await Future.wait([
      _getOneTotalForExpanse(params.month, kMonth),
      _getOneTotalForExpanse(params.monthSideId, kMonthSide),
      _getOneTotalForExpanse(params.monthPersonId, kMonthPerson),
      _getOneTotalForExpanse(params.monthPersonSideId, kMonthPersonSide),
    ]);

    return result;
  }

  Future<TotalModel> _getOneTotalForExpanse(String id, String idName) async {
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

  @override
  Future<List<TotalModel>> getTotalsWithIds(List<String> ids) async {
    try {
      final models = await _getTotals(ids);
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      print(exception.message);

      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      print(exception.message);
      throw exception;
    }
  }

  Future<List<TotalModel>> _getTotals(List<String> ids) async {
    List<TotalModel> models = [];
    TotalModel model;
    for (String id in ids) {
      model = await _getOneTotal(id);
      models.add(model);
    }
    return models;
  }

  Future<TotalModel> _getOneTotal(String id) async {
    final result = await _services.getItemsWithValue(
      values: [id],
      tableName: kTotals,
      columnsNames: [kId],
    );
    if (result.isNotEmpty) {
      final model = TotalModel.fromJson(result.first);
      return model;
    } else {
      final model = TotalModel.fromNoJson(id, id);
      return model;
    }
  }
}
