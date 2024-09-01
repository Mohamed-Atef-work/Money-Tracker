import 'package:dartz/dartz.dart';
import 'package:money_tracker/core/error/failure.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';
import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';

abstract class DataRepo {
  Future<Either<Failure, List<PersonModel>>> getPersons();
  Future<Either<Failure, List<SpendingSideModel>>> getSpendingSides();
  Future<Either<Failure, List<ExpanseModel>>> getMonthExpanses(String moth);
  Future<Either<Failure, List<ExpanseModel>>> getExpansesOfMonthAndSomeOther(
      GetExpansesParams params);
}

class GetExpansesParams {
  final List values;
  final List columnNames;

  GetExpansesParams({
    required this.values,
    required this.columnNames,
  });
}
