import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/screens/statistics_layout/widgets/line_graph_widget.dart';
import 'package:money_tracker/screens/statistics_layout/widgets/circular_graph_widget.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/persons_statistics_controller.dart';

class PersonsStatisticsView extends StatelessWidget {
  const PersonsStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final personsSides = Get.find<PersonsSidesController>();
    final personsController = Get.find<PersonsStatisticsController>();
    return Column(
      children: [
        GetBuilder<PersonsSidesController>(
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
                onPressed: () => personsController.getData(),
              ),
            ],
          ),
        ),
        Expanded(
          child: GetBuilder<PersonsStatisticsController>(builder: (controller) {
            if (controller.dataState == RequestState.loading) {
              return const LoadingWidget();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatisticsLineGraphWidget(
                    totals: controller.personTotalEachMonth,
                    leftTitle:
                        personsSides.persons[personsSides.selectedPerson],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularGraphWidget(
                          totals: controller.eachPersonTotalOfTheMonth),
                      CircularGraphWidget(
                          totals: controller.eachSideOfPersonOfTheMonth),
                    ],
                  ),
                ],
              );
            }
          }),
        ),
      ],
    );
  }
}

final model = ExpanseModel(
  money: 30,
  month: "january",
  person: "Mohamed",
  spendingSide: "Shopping",
  description:
      "When i was shopping i bought a coat and a lot of kilos of mango,then i went to the library and bought some book,then i went to the library and bought some book,then i went to the library and bought some book",
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
