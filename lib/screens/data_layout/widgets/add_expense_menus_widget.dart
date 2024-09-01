import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';

class MenusWidget extends StatelessWidget {
  const MenusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddExpanseController>(
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
            items: controller.months,
            selectedValue: controller.selectedMonth,
            onChanged: (int? selected) => controller.selectMonth(selected!),
          ),
        ],
      ),
    );
  }
}
