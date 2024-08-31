import 'package:get/get.dart';

class PersonsDataController extends GetxController {
  int currentPersonIndex = 0;

  void personIndex(int index) {
    currentPersonIndex = index;
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