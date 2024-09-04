import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class SpendingSidesDataView extends StatelessWidget {
  const SpendingSidesDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.01),
        GetBuilder<PersonsSidesDataController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropDownMenuComponent(
                items: English.monthsList,
                selectedValue: controller.selectedMonth,
                onChanged: (String? selected) =>
                    controller.selectMonth(selected!),
              ),
              DropDownMenuComponent(
                items: controller.sides,
                selectedValue: controller.selectedSide ?? "default",
                onChanged: (String? selected) =>
                    controller.selectSide(selected!),
              ),
              CustomButton(text: English.search.tr),
            ],
          ),
        ),
      ],
    );
  }
}
