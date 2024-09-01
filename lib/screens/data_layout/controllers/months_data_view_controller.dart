import 'package:get/get.dart';

class MonthsDataController extends GetxController {
  int selectedMonth = 0;

  void selectMonth(int index) {
    selectedMonth = index;
    update();
  }
}
