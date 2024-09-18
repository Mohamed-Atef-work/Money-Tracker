import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/screens/statistics_module/widgets/line_graph_widget.dart';
import 'package:money_tracker/screens/statistics_module/widgets/circular_graph_widget.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/persons_statistics_controller.dart';

class PersonsStatisticsWidget extends StatelessWidget {
  const PersonsStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final personsSides = Get.find<PersonsSidesController>();
    return GetBuilder<PersonsStatisticsController>(builder: (controller) {
      if (controller.dataState == RequestState.loading) {
        return const LoadingWidget();
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
                  title:
                      English.eachSpendingSideTotalOfThisPersonInThisMonth.tr,
                ),
                CircularGraphWidget(
                  monthPersonSide: MonthPersonSide.person,
                  title: English.eachPersonTotalOfThisMonth.tr,
                  totals: controller.eachPersonTotalOfTheMonth,
                ),
              ],
            ),
          ],
        );
      }
    });
  }
}
