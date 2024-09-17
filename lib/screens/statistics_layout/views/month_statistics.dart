import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/statistics_layout/widgets/line_graph_widget.dart';
import 'package:money_tracker/screens/statistics_layout/widgets/circular_graph_widget.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/months_statistics_controller.dart';

class MonthsStatisticsView extends StatelessWidget {
  const MonthsStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final monthStatistics = Get.find<MonthsStatisticsController>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<PersonsSidesController>(
              builder: (controller) => DropDownMenuComponent(
                items: controller.translatedMonths,
                selectedValue: controller.selectedMonth,
                onChanged: (int? selected) => controller.selectMonth(selected!),
              ),
            ),
            CustomButton(
              text: English.search.tr,
              onPressed: () => monthStatistics.getData(),
            ),
          ],
        ),
        Expanded(
          child: GetBuilder<MonthsStatisticsController>(
            builder: (controller) {
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
                          title: English.eachSpendingSideTotalOfThisMonth.tr,
                        ),
                        CircularGraphWidget(
                          totals: controller.eachPersonTotal,
                          monthPersonSide: MonthPersonSide.person,
                          title: English.eachPersonTotalOfThisMonth.tr,
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
