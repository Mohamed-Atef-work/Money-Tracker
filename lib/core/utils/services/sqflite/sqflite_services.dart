import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/utils/services/sqflite/db_constants.dart';

class SqfliteServices {
  static Database? _db;

  Future<Database?> get getDB async {
    if (_db == null) {
      _db = await initializeDB();
      return _db;
    } else {
      return _db;
    }
  }

  initializeDB() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, kdbPath);
    final db = openDatabase(path, version: 1, onCreate: _onCreateDataBase);
    return db;
  }

  FutureOr<void> _onCreateDataBase(Database db, int version) async {
    var batch = db.batch();
    _createTables(batch);
    await batch.commit();
  }

  /// insert data in a table
  Future<int> insertItem({
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final db = await getDB;
    final response = await db!.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return response;
  }

  /// Query data with a specific column value
  Future<List<Map<String, dynamic>>> getItemsWithValue({
    required List values,
    required String tableName,
    required List columnsNames,
  }) async {
    String whereQuery = _createWhereQuery(columnsNames);

    final db = await getDB;
    final response =
        await db!.query(tableName, where: whereQuery, whereArgs: values);
    return response;
  }

  Future<List<Map<String, dynamic>>> getItems(String tableName) async {
    final db = await getDB;
    final response = await db!.query(tableName);
    return response;
  }

  Future<int> updateItem({
    required int id,
    required String tableName,
    required Map<String, dynamic> data,
  }) async {
    final db = await getDB;
    final response =
        await db!.update(tableName, data, where: '$kId = ?', whereArgs: [id]);
    return response;
  }

  Future<int> deleteItem({required int id, required String tableName}) async {
    final db = await getDB;
    final response =
        await db!.delete(tableName, where: '$kId = ?', whereArgs: [id]);
    return response;
  }

  String _createWhereQuery(List columnsNames) {
    String whereQuery = "";
    for (String ele in columnsNames) {
      whereQuery += "$ele = ?";
      if (ele != columnsNames.last) {
        whereQuery += " $kAnd ";
      }
    }
    return whereQuery;
  }

  void _createTables(Batch batch) {
    batch.execute(
      '''$kCreateTable $kJanuary
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kFebruary
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kMars
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kApril
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kMay
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kJune
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kJuly
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kAugust
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kSeptember
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kOctober
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kNovember
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kDecember
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kPersons
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kSpendingSides
      (
      $kId $kInteger $kPrimary $kKey,
      $kSpendingSide $kText
      )''',
    );
    batch.execute(
      '''$kCreateTable $kTotals
      (
      $kId $kInteger $kPrimary $kKey,
      $kTotal $kText
      )''',
    );
  }
}
