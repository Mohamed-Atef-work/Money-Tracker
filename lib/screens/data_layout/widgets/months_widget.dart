import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/scrollable_row_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';

class MonthsWidget extends StatelessWidget {
  const MonthsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MonthsDataController>();
    return GetBuilder<MonthsDataController>(
      builder: (_) {
        return SizedBox(
          height: context.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.titles.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => ScrollableRowItemComponent(
              title: controller.titles[index],
              onTap: () => controller.monthIndex(index),
              isChosen: controller.currentMonthIndex == index ? true : false,
            ),
          ),
        );
      },
    );
  }
}
