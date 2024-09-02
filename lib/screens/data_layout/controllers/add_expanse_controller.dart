import 'package:get/get.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';

class AddExpanseController extends GetxController {
  final DataRepo _repo = Get.find<DataRepo>();

  int selectedSide = 0;
  int selectedMonth = 0;
  int selectedPerson = 0;

  List<String> persons = [];
  List<String> sides = [];

  void getPersons() async {
    try {
      final models = await _repo.getPersons();
      //persons = models;
      update();
    } on LocalDataBaseException catch (exc) {}
  }

  void getSides() async {
    try {
      final models = await _repo.getSpendingSides();
      //sides = models;
      update();
    } on LocalDataBaseException catch (exc) {}
  }

  /*void addExpanses() async {
    try {
      final models = await _repo.addExpense();
      sides = models;
      update();
    } on LocalDataBaseException catch (exc) {}
  }*/

  void selectSide(int selected) {
    selectedSide = selected;
    update();
  }

  void selectMonth(int selected) {
    selectedMonth = selected;
    update();
  }

  void selectPerson(int selected) {
    selectedPerson = selected;
    update();
  }
}
