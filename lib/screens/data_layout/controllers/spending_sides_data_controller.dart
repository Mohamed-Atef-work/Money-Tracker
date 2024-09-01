import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class SpendingSidesDataController extends GetxController {
  int selectedMonth = 0;
  int selectedSide = 0;

  void selectMonth(int selected) {
    selectedMonth = selected;
    update();
  }

  void selectSide(int index) {
    selectedSide = index;
    update();
  }
  List<String> spendingSides = [
    "shopping",
    "shopping",
    "shopping",
    "shopping",
    "shopping",
  ];
}
