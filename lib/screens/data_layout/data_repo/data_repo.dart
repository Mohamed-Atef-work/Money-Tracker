import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';

abstract class DataRepo {
  Future<List<PersonModel>> getPersons();
  Future<void> addPerson(PersonModel model);
  Future<void> addExpanse(ExpanseModel model);
  Future<List<SpendingSideModel>> getSpendingSides();
  Future<void> addSpendingSide(SpendingSideModel model);
  Future<List<ExpanseModel>> getMonthExpanses(String month);
  Future<List<ExpanseModel>> getExpansesOfMonthAndSomeOther(
      GetExpansesParams params);
}

class AddPersonOrSideParams {
  final String table;
  final String value;

  AddPersonOrSideParams({required this.table, required this.value});
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
