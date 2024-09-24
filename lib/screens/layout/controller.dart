import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/arabic.dart';
import 'package:money_tracker/core/config/local/english.dart';

class LayoutController extends GetxController {
  int index = 0;

  int language = 0;

  selectLanguage(int current) {
    language = current;
    final local = Locale(languagesCodes[language]);
    Get.updateLocale(local);
    update();
  }

  changeIndex(int current) {
    index = current;
    update();
  }

  List<String> languagesCodes = [English.code, Arabic.code];

  List<String> titles = [
    English.persons.tr,
    English.spendingSides.tr,
    English.months.tr,
  ];
}
