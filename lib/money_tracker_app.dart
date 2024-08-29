import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/pages.dart';
import 'package:money_tracker/core/config/bindings.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/utils/local/translation.dart';
import 'package:money_tracker/core/utils/local/local_constants.dart';

class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages(),
      title: English().appName,
      locale: Locale(kArabicCode),
      initialBinding: AppBindings(),
      translations: AppLocalization(),
    );
  }
}
