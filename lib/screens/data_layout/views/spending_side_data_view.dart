import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/screens/data_layout/controllers/spending_sides_data_controller.dart';
import 'package:money_tracker/screens/data_layout/widgets/spending_sides_data_widget.dart';

class SpendingSidesDataView extends StatelessWidget {
  const SpendingSidesDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * 0.01),
        GetBuilder<SpendingSidesDataController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropDownMenuComponent(
                items: English.monthsList,
                selectedValue: controller.selectedMonth,
                onChanged: (int? selected) => controller.selectMonth(selected!),
              ),
              DropDownMenuComponent(
                items: controller.spendingSides,
                selectedValue: controller.selectedSide,
                onChanged: (int? selected) => controller.selectSide(selected!),
              ),
              CustomButton(text: English.search.tr),
            ],
          ),
        ),
      ],
    );
  }
}
