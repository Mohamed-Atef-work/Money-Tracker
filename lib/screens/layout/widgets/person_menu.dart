import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_module/controllers/persons_data_controller.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/persons_statistics_controller.dart';

class PersonMenuWidget extends StatelessWidget {
  const PersonMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<PersonsDataController>();
    final statistics = Get.find<PersonsStatisticsController>();

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
            items: controller.persons,
            selectedValue: controller.selectedPerson,
            onChanged: (int? selected) => controller.selectPerson(selected!),
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
