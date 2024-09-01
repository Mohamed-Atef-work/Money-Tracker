import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/utils/screens_strings.dart';
import 'package:money_tracker/core/components/custom_button.dart';

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
            onPressed: () => Get.toNamed(Screens.addExpanse),
          ),
          CustomButton(
            text: English.data.tr,
            onPressed: () => Get.toNamed(Screens.dataLayout),
          ),
          CustomButton(
            text: English.statistics.tr,
            onPressed: () => Get.toNamed(Screens.statisticsLayout),
          ),
        ],
      ),
    );
  }
}
