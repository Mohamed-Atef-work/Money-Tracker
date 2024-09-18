import 'package:get/get.dart';
import 'package:money_tracker/core/config/local/english.dart';

class LayoutController extends GetxController {
  int index = 0;

  changeIndex(int current) {
    index = current;
    update();
  }

  List<String> titles = [
    English.persons.tr,
    English.spendingSides.tr,
    English.months.tr,
  ];
}
