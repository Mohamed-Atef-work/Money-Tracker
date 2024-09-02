import 'package:dartz/dartz.dart';
import 'package:money_tracker/core/error/failure.dart';
import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';

abstract class DataRepo {
  Future<List<PersonModel>> getPersons();
  Future<List<SpendingSideModel>> getSpendingSides();
  Future<List<ExpanseModel>> getMonthExpanses(String month);
  Future<List<ExpanseModel>> getExpansesOfMonthAndSomeOther(
      GetExpansesParams params);
}

class GetExpansesParams {
  final List values;
  final String month;
  final List columnNames;

  GetExpansesParams({
    required this.month,
    required this.values,
    required this.columnNames,
  });
}
