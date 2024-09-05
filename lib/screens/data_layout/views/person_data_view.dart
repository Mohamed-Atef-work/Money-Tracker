import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/messenger_component.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/expenses_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/persons_data_controller.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class PersonsDataView extends StatelessWidget {
  const PersonsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final personsController = Get.find<PersonsDataController>();
    return Column(
      children: [
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
                items: controller.persons,
                selectedValue: controller.selectedPerson,
                onChanged: (int? selected) =>
                    controller.selectPerson(selected!),
              ),
              CustomButton(
                text: English.search.tr,
                onPressed: () => personsController.getExpanses(),
              ),
            ],
          ),
        ),
        GetBuilder<PersonsDataController>(
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

final model = ExpanseModel(
  month: "january",
  money: 30,
  person: "Mohamed",
  description:
      "When i was shopping i bought a coat and a lot of kilos of mango,then i went to the library and bought some book,then i went to the library and bought some book,then i went to the library and bought some book",
  spendingSide: "Shopping",
);

final expanses = [
  model,
  model,
  model,
  model,
  model,
  model,
  model,
  model,
  model,
];
