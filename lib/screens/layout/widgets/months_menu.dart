import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_module/controllers/months_data_controller.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/months_statistics_controller.dart';

class MonthMenuWidget extends StatelessWidget {
  const MonthMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<MonthsDataController>();
    final statistics = Get.find<MonthsStatisticsController>();
    final personSideController = Get.find<PersonsSidesController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GetBuilder<PersonsSidesController>(
          builder: (controller) => DropDownMenuComponent(
            items: controller.translatedMonths,
            selectedValue: controller.selectedMonth,
            onChanged: (int? selected) => controller.selectMonth(selected!),
          ),
        ),
        CustomButton(
          text: English.search.tr,
          onPressed: () {
            final month =
                English.monthsList[personSideController.selectedMonth];
            data.getExpanses(month);
            statistics.getData();
          },
        ),
      ],
    );
  }
}
