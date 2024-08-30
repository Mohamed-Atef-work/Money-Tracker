import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class MonthsDataController extends GetxController {
  int currentMonthIndex = 0;

  void monthIndex(int index) {
    currentMonthIndex = index;
    update();
  }

  List<String> titles = [
    English.january.tr,
    English.february.tr,
    English.mars.tr,
    English.april.tr,
    English.may.tr,
    English.june.tr,
    English.july.tr,
    English.august.tr,
    English.september.tr,
    English.october.tr,
    English.november.tr,
    English.december.tr,
  ];
}
