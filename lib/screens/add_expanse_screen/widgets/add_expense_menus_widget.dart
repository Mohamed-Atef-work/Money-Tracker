import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';

class MenusWidget extends StatelessWidget {
  const MenusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonsSidesController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropDownMenuComponent(
            items: controller.persons,
            selectedValue: controller.selectedPerson,
            onChanged: (int? selected) => controller.selectPerson(selected!),
          ),
          DropDownMenuComponent(
            items: controller.sides,
            selectedValue: controller.selectedSide,
            onChanged: (int? selected) => controller.selectSide(selected!),
          ),
          DropDownMenuComponent(
            items: English.monthsList.map((e) => e.tr).toList(),
            selectedValue: controller.selectedMonth,
            onChanged: (int? selected) => controller.selectMonth(selected!),
          ),
        ],
      ),
    );
  }
}
