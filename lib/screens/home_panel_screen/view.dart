import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/config/routes/routes_strings.dart';

class HomePanelScreen extends StatelessWidget {
  const HomePanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            text: English.addExpanse.tr,
            onPressed: () => Get.toNamed(Routes.addExpanse),
          ),
          CustomButton(
            text: English.data.tr,
            onPressed: () => Get.toNamed(Routes.dataLayout),
          ),
          CustomButton(
            text: English.statistics.tr,
            onPressed: () => Get.toNamed(Routes.statisticsLayout),
          ),
        ],
      ),
    );
  }
}
