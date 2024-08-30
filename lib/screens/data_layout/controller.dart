import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class DataLayoutController extends GetxController {
  //final English english;
  //DataLayoutController(this.english);

  int index = 0;
  List<String> titles = [
    English.months,
    English.persons,
    English.spendingSide,
  ];

  currentIndex(int current) {
    index = current;
    update();
  }
}
