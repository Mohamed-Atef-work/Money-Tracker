import 'package:get/get.dart';

class SpendingSidesDataController extends GetxController {
  int currentSpendingSideIndex = 0;

  void spendingSideIndex(int index) {
    currentSpendingSideIndex = index;
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
