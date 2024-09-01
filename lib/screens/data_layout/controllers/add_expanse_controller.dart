import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class AddExpanseController extends GetxController {
  int selectedSide = 0;
  int selectedMonth = 0;
  int selectedPerson = 0;

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

  List<String> persons = ["Mohamed", "Ahmed", "Ali"];
  List<String> sides = ["Shopping", "Bills", "Fruit"];
  List<String> months = [
    English.january,
    English.february,
    English.mars,
    English.april,
    English.may,
    English.june,
    English.july,
    English.august,
    English.september,
    English.october,
    English.november,
    English.december
  ];
}
