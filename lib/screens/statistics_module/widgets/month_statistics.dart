import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/widgets/line_graph_widget.dart';
import 'package:money_tracker/screens/statistics_module/widgets/circular_graph_widget.dart';
import 'package:money_tracker/screens/statistics_module/controllers/months_statistics_controller.dart';

class MonthsStatisticsWidget extends StatelessWidget {
  const MonthsStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final personsSides = Get.find<PersonsSidesController>();
    return GetBuilder<MonthsStatisticsController>(
      builder: (controller) {
        final month = English.monthsList[personsSides.selectedMonth];
        if (controller.dataState == RequestState.loading) {
          return const LoadingWidget();
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatisticsLineGraphWidget(
                leftTitle: "_",
                totals: controller.eachMonthTotal,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularGraphWidget(
                    totals: controller.eachSideTotal,
                    monthPersonSide: MonthPersonSide.side,
                    title: English.eachSpendingSideTotalOfThisMonth(month.tr),
                  ),
                  CircularGraphWidget(
                    totals: controller.eachPersonTotal,
                    monthPersonSide: MonthPersonSide.person,
                    title: English.eachPersonTotalOfThisMonth(month.tr),
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
