import 'package:money_tracker/core/utils/services/sqflite/db_constants.dart';
import 'package:sqflite/sqflite.dart';

abstract class Failure {
  final String message;
  final dynamic object;

  const Failure({
    this.object,
    required this.message,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.object,
    required super.message,
  });
}

class LocalDataBaseFailure extends Failure {
  const LocalDataBaseFailure({required super.message});

}
