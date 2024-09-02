import 'package:money_tracker/core/utils/local/english.dart';
import 'package:sqflite/sqflite.dart';

class ServerException implements Exception {
  final String message;
  final Object? object;
  const ServerException({required this.message, this.object});
}

class LocalDataBaseException implements Exception {
  final String message;
  const LocalDataBaseException(this.message);

  factory LocalDataBaseException.fromSqflite(DatabaseException e) {
    if (e.isDatabaseClosedError()) {
      return LocalDataBaseException(English.databaseIsClosed);
    } else if (e.isNoSuchTableError()) {
      return LocalDataBaseException(English.tableDoesNotExist);
    } else if (e.isSyntaxError()) {
      return LocalDataBaseException(English.syntaxErrorInSQLQuery);
    } else if (e.isOpenFailedError()) {
      return LocalDataBaseException(English.failedToOpenTheDatabase);
    } else if (e.isReadOnlyError()) {
      return LocalDataBaseException(English.databaseIsInReadOnlyMode);
    } else if (e.isUniqueConstraintError()) {
      return LocalDataBaseException(English.uniqueConstraintViolation);
    } else {
      return LocalDataBaseException(
          English.unknownDatabaseError + e.toString());
    }
  }
}
