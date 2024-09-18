import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_app.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MoneyTrackerApp());
}
/*  final model = ExpanseModel(
    money: 40,
    month: kJanuary,
    person: "Ahmed",
    spendingSide: "Football",
    description: "I bought that!",
  );*/
/*  final values = ["Mohamed", "Shopping"];
  final columnsNames = [kPerson, kSpendingSide];
  final response = await sqlServices.getItemsWithValue(
    values: values,
    tableName: kJanuary,
    columnsNames: columnsNames,
  );
  List<ExpanseModel> models =
      response.map((e) => ExpanseModel.fromJson(e)).toList();
  print(models.length);
  print(response);*/
