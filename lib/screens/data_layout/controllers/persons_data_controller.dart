import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class PersonsDataController extends GetxController {
  int selectedPerson = 0;
  int selectedMonth = 0;

  void selectPerson(int index) {
    selectedPerson = index;
    update();
  }

  void selectMonth(int index) {
    selectedMonth = index;
    update();
  }

  List<String> persons = [
    "Mohamed",
    "Mohamed",
    "Mohamed",
    "Mohamed",
    "Mohamed",
    "Mohamed",
  ];
}
