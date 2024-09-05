import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/expenses_component.dart';
import 'package:money_tracker/core/components/messenger_component.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/spending_sides_data_controller.dart';

class SpendingSidesDataView extends StatelessWidget {
  const SpendingSidesDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final sidesController = Get.find<SpendingSidesDataController>();
    return Column(
      children: [
        SizedBox(height: context.height * 0.01),
        GetBuilder<PersonsSidesDataController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropDownMenuComponent(
                items: controller.translatedMonths,
                selectedValue: controller.selectedMonth,
                onChanged: (int? selected) => controller.selectMonth(selected!),
              ),
              DropDownMenuComponent(
                items: controller.sides,
                selectedValue: controller.selectedSide,
                onChanged: (int? selected) => controller.selectSide(selected!),
              ),
              CustomButton(
                text: English.search.tr,
                onPressed: () => sidesController.getExpanses(),
              ),
            ],
          ),
        ),
        GetBuilder<SpendingSidesDataController>(
          builder: (controller) {
            if (controller.expanses.isEmpty) {
              return MessengerComponent(English.thereIsNoData.tr);
            } else {
              return ExpansesListViewWidget(controller.expanses);
            }
          },
        ),
      ],
    );
  }
}
