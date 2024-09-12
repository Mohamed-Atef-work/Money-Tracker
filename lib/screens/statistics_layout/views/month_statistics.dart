import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/statistics_layout/widgets/line_graph_widget.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/months_statistics_controller.dart';

class MonthsStatisticsView extends StatelessWidget {
  const MonthsStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final personSide = Get.find<PersonsSidesController>();
    final monthStatistics = Get.find<MonthsStatisticsController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        const SizedBox(height: 10),
        GetBuilder<MonthsStatisticsController>(
          builder: (controller) {
            if (controller.dataState == RequestState.loading) {
              return const LoadingWidget();
            } else {
              List<FlSpot> spots() => List.generate(
                    controller.eachMonthsTotal.length,
                    (index) => FlSpot(
                      index.toDouble(),
                      controller.eachMonthsTotal[index].total.toDouble(),
                    ),
                  );
              return StatisticsLineGraphWidget(
                spots: spots(),
                leftTitle: "_",
              );
            }
          },
        ),
      ],
    );
  }
}
