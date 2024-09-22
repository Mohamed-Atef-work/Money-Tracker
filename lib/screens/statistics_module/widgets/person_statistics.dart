import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/core/components/messenger_component.dart';
import 'package:money_tracker/screens/statistics_module/widgets/line_graph_widget.dart';
import 'package:money_tracker/screens/statistics_module/widgets/circular_graph_widget.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/persons_statistics_controller.dart';

class PersonsStatisticsWidget extends StatelessWidget {
  const PersonsStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final personsSides = Get.find<PersonsSidesController>();
    return GetBuilder<PersonsStatisticsController>(
      builder: (controller) {
        final month = English.monthsList[personsSides.selectedMonth];
        final person = personsSides.persons[personsSides.selectedPerson];

        if (controller.dataState == RequestState.loading) {
          return const LoadingWidget();
        }
        if (controller.dataState == RequestState.error) {
          return MessengerComponent(English.error.tr);
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatisticsLineGraphWidget(
                totals: controller.personTotalEachMonth,
                leftTitle: personsSides.persons[personsSides.selectedPerson],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularGraphWidget(
                    monthPersonSide: MonthPersonSide.side,
                    totals: controller.eachSideOfPersonOfTheMonth,
                    title: English.eachSpendingSideTotalOfThisPersonInThisMonth(
                        person, month.tr),
                  ),
                  CircularGraphWidget(
                    monthPersonSide: MonthPersonSide.person,
                    title: English.eachPersonTotalOfThisMonth(month.tr),
                    totals: controller.eachPersonTotalOfTheMonth,
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
