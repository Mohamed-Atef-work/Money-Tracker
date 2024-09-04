import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class MenusWidget extends StatelessWidget {
  const MenusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonsSidesDataController>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropDownMenuComponent(
            items: controller.persons,
            selectedValue: controller.selectedPerson,
            onChanged: (String? selected) => controller.selectPerson(selected!),
          ),
          DropDownMenuComponent(
            items: controller.sides,
            selectedValue: controller.selectedSide,
            onChanged: (String? selected) => controller.selectSide(selected!),
          ),
          DropDownMenuComponent(
            items: English.monthsList,
            selectedValue: controller.selectedMonth,
            onChanged: (String? selected) => controller.selectMonth(selected!),
          ),
        ],
      ),
    );
  }
}
