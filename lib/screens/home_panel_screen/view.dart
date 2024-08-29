import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/utils/screens_strings.dart';
import 'package:money_tracker/core/components/custom_button.dart';

class HomePanelScreen extends StatelessWidget {
  const HomePanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final english = Get.find<English>();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            text: english.addNewRevenue.tr,
            onPressed: () {
              Get.toNamed(Screens.addNewRevenue);
            },
          ),
          CustomButton(
            text: english.data.tr,
            onPressed: () {
              Get.toNamed(Screens.dataLayout);
            },
          ),
          CustomButton(
            text: english.statistics.tr,
            onPressed: () {
              Get.toNamed(Screens.statisticsLayout);
            },
          ),
        ],
      ),
    );
  }
}
