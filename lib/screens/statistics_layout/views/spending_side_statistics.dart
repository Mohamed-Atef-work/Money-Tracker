import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/spending_sides_statistics_controller.dart';
import 'package:money_tracker/screens/statistics_layout/widgets/line_graph_widget.dart';

class SpendingSidesStatisticsView extends StatelessWidget {
  const SpendingSidesStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    final sidesController = Get.find<SpendingSidesStatisticsController>();
    final personSide = Get.find<PersonsSidesController>();
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
                items: controller.sides,
                selectedValue: controller.selectedSide,
                onChanged: (int? selected) => controller.selectSide(selected!),
              ),
              CustomButton(
                text: English.search.tr,
                onPressed: () => sidesController.getData(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GetBuilder<SpendingSidesStatisticsController>(builder: (controller) {
          if (controller.dataState == RequestState.loading) {
            return const LoadingWidget();
          } else if (controller.sideEachMonth.isEmpty) {
            return Text("NoData");
          } else {
            List<FlSpot> spots() => List.generate(
                  controller.sideEachMonth.length,
                  (index) => FlSpot(
                    index.toDouble(),
                    controller.sideEachMonth[index].total.toDouble(),
                  ),
                );
            return StatisticsLineGraphWidget(
              spots: spots(),
              leftTitle: personSide.sides[personSide.selectedSide],
            );
          }
        }),
      ],
    );
  }
}
