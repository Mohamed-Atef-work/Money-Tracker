import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/bindings.dart';
import 'package:money_tracker/core/config/local/arabic.dart';
import 'package:money_tracker/core/config/routes/pages.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/config/local/translation.dart';

class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages(),
      title: English.appName,
      locale: Locale(English.code),
      //initialRoute: Screens.test,
      initialBinding: AppBindings(),
      translations: AppLocalization(),
    );
  }
}
