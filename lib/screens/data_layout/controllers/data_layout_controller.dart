import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class DataLayoutController extends GetxController {
  int index = 0;

  currentIndex(int current) {
    index = current;
    update();
  }

  List<String> titles = [
    English.months,
    English.persons,
    English.spendingSides,
  ];
}
