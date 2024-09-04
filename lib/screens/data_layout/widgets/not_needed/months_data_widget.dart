import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/scrollable_row_component.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';

/*class MonthsDataWidget extends StatelessWidget {
  const MonthsDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MonthsDataController>();
    return GetBuilder<MonthsDataController>(
      builder: (_) {
        return ScrollableRowComponent(
          titles: English.monthsList,
          comingIndex: controller.selectedMonth,
          onTap: (chosenIndex) => controller.selectMonth(chosenIndex),
        );
      },
    );
  }
}*/
