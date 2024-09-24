import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/data_module/controllers/spending_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/spending_sides_statistics_controller.dart';

class SpendingSideMenuWidget extends StatelessWidget {
  const SpendingSideMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<SpendingSidesDataController>();
    final statistics = Get.find<SpendingSidesStatisticsController>();

    return GetBuilder<PersonsSidesController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropDownMenuComponent(
            selectedValue: controller.selectedMonth,
            items: English.monthsList.map((e) => e.tr).toList(),
            onChanged: (int? selected) => controller.selectMonth(selected!),
          ),
          DropDownMenuComponent(
            items: controller.sides,
            selectedValue: controller.selectedSide,
            onChanged: (int? selected) => controller.selectSide(selected!),
          ),
          CustomButton(
            text: English.search.tr,
            onPressed: () {
              data.getExpanses();
              statistics.getData();
            },
          ),
        ],
      ),
    );
  }
}
