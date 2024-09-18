import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/screens/statistics_module/widgets/line_graph_widget.dart';
import 'package:money_tracker/screens/statistics_module/widgets/circular_graph_widget.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/spending_sides_statistics_controller.dart';

class SpendingSidesStatisticsWidget extends StatelessWidget {
  const SpendingSidesStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final personSide = Get.find<PersonsSidesController>();
    return GetBuilder<SpendingSidesStatisticsController>(
      builder: (controller) {
        if (controller.dataState == RequestState.loading) {
          return const LoadingWidget();
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatisticsLineGraphWidget(
                totals: controller.sideEachMonth,
                leftTitle: personSide.sides[personSide.selectedSide],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularGraphWidget(
                    totals: controller.eachSideOfMonth,
                    monthPersonSide: MonthPersonSide.side,
                    title: English.eachSpendingSideTotalOfThisMonth.tr,
                  ),
                  CircularGraphWidget(
                    monthPersonSide: MonthPersonSide.person,
                    totals: controller.eachPersonTotalOfSideInMonth,
                    title:
                        English.eachPersonTotalOfThisSpendingSideInThisMonth.tr,
                  ),
                ],
              )
            ],
          );
        }
      },
    );
  }
}
