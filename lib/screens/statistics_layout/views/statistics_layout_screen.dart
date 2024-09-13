import 'package:get/get.dart';
import 'month_statistics.dart';
import 'person_statistics.dart';
import 'spending_side_statistics.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_text.dart';
import 'package:money_tracker/screens/statistics_layout/controller.dart';
import 'package:money_tracker/core/components/bottom_navigation_bar.dart';

class StatisticsLayoutScreen extends StatelessWidget {
  const StatisticsLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StatisticsLayoutController>();

    return GetBuilder<StatisticsLayoutController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(title: English.statistics.tr),
        body: _body(controller.index),
        bottomNavigationBar: AppBottomNav(
          index: controller.index,
          onTap: (index) => controller.changeIndex(index),
        ),
      ),
    );
  }
}

Widget _body(int index) {
  if (index == 0) {
    return const PersonsStatisticsView();
  } else if (index == 1) {
    return const SpendingSidesStatisticsView();
  } else {
    return const MonthsStatisticsView();
  }
}
