import 'package:money_tracker/core/utils/services/sqflite/db_constants.dart';
import 'package:sqflite/sqflite.dart';

class ServerException implements Exception {
  final String message;
  final Object? object;
  const ServerException({
    required this.message,
    this.object,
  });
}

class LocalDataBaseException implements Exception {
  final String message;
  const LocalDataBaseException(this.message);

  factory LocalDataBaseException.fromSqflite(DatabaseException e) {
    if (e.isNoSuchTableError()) {
      return const LocalDataBaseException(kTableDoesNotExist);
    } else if (e.isSyntaxError()) {
      return const LocalDataBaseException(kSyntaxErrorInSQLQuery);
    } else if (e.isOpenFailedError()) {
      return const LocalDataBaseException(kFailedToOpenTheDatabase);
    } else if (e.isDatabaseClosedError()) {
      return const LocalDataBaseException(kDatabaseIsClosed);
    } else if (e.isReadOnlyError()) {
      return const LocalDataBaseException(kDatabaseIsInReadOnlyMode);
    } else if (e.isUniqueConstraintError()) {
      return const LocalDataBaseException(kUniqueConstraintViolation);
    } else {
      return LocalDataBaseException('$kUnknownDatabaseError ${e.toString()}');
    }
  }
}
