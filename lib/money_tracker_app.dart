import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/bindings.dart';
import 'package:money_tracker/core/config/routes/pages.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/config/local/translation.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/config/routes/routes_strings.dart';

import 'core/config/local/arabic.dart';

class MoneyTrackerApp extends StatelessWidget {
  const MoneyTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: pages(),
      title: English.appName.tr,
      locale: Locale(Arabic.code),
      initialRoute: Routes.layout,
      initialBinding: AppBindings(),
      translations: AppLocalization(),
      theme: ThemeData(scaffoldBackgroundColor: kPrimaryColorYellow),
    );
  }
}
