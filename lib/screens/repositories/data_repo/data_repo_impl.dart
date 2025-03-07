import 'data_repo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/person_model.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/repositories/models/spending_side_model.dart';

class DataRepoImpl implements DataRepo {
  final SqfliteServices _sqflite;

  DataRepoImpl(this._sqflite);

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
      final exception = LocalDataBaseException(exc.toString());
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
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }

  @override
  Future<List<SpendingSideModel>> getSpendingSides() async {
    try {
      final result = await _sqflite.getItems(kSpendingSides);
      final models = result.map((e) => SpendingSideModel.fromJson(e)).toList();
      return models;
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
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
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }

  @override
  Future<void> addExpanse(ExpanseModel model) async {
    try {
      final result = await _sqflite.insertItem(
        data: model.toJson(),
        tableName: model.month,
      );
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }

  @override
  Future<void> addPerson(PersonModel model) async {
    try {
      final result = await _sqflite.insertItem(
        data: model.toJson(),
        tableName: kPersons,
      );
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }

  @override
  Future<void> addSpendingSide(SpendingSideModel model) async {
    try {
      final result = await _sqflite.insertItem(
        tableName: kSpendingSides,
        data: model.toJson(),
      );
    } on DatabaseException catch (exc) {
      final exception = LocalDataBaseException.fromSqflite(exc);
      throw exception;
    } catch (exc) {
      final exception = LocalDataBaseException(exc.toString());
      throw exception;
    }
  }
}
