import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:money_tracker/core/error/failure.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';

class DataRepoImpl implements DataRepo {
  final SqfliteServices _sqflite = Get.find<SqfliteServices>();

  @override
  Future<List<PersonModel>> getPersons() async {
    try {
      final result = await _sqflite.getItems(kPersons);
      final models = result.map((e) => PersonModel.fromJson(e)).toList();
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseFailure(message: exc.toString());
      throw exception;
    }
  }

  @override
  Future<List<ExpanseModel>> getExpansesOfMonthAndSomeOther(
      GetExpansesParams params) async {
    try {
      final result = await _sqflite.getItemsWithValue(
        values: params.values,
        tableName: params.month,
        columnsNames: params.columnNames,
      );
      final models = result.map((e) => ExpanseModel.fromJson(e)).toList();
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseFailure(message: exc.toString());
      throw exception;
    }
  }

  @override
  Future<List<SpendingSideModel>> getSpendingSides() async {
    try {
      final result = await _sqflite.getItems(kPersons);
      final models = result.map((e) => SpendingSideModel.fromJson(e)).toList();
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseFailure(message: exc.toString());
      throw exception;
    }
  }

  @override
  Future<List<ExpanseModel>> getMonthExpanses(String month) async {
    try {
      final result = await _sqflite.getItems(month);
      final models = result.map((e) => ExpanseModel.fromJson(e)).toList();
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseFailure(message: exc.toString());
      throw exception;
    }
  }
}
