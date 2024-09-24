import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/components/messenger_component.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';

class CircularGraphWidget extends StatelessWidget {
  final String title;
  final List<TotalModel> totals;
  final MonthPersonSide monthPersonSide;
  const CircularGraphWidget({
    super.key,
    required this.title,
    required this.totals,
    required this.monthPersonSide,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = _isEmpty(totals);
    return isEmpty
        ? MessengerComponent(
            English.thereIsNoData.tr,
            imageHeight: context.height * 0.2,
          )
        : SizedBox(
            width: context.width * 0.4,
            height: context.height * 0.3,
            child: Column(
              children: [
                Expanded(
                  child: PieChart(
                    swapAnimationCurve: Curves.linear,
                    swapAnimationDuration: kDuration1Second,
                    PieChartData(sections: _sections(), centerSpaceRadius: 10),
                  ),
                ),
                Text(title),
              ],
            ),
          );
  }

  List<PieChartSectionData>? _sections() => List.generate(
        totals.length,
        (index) => PieChartSectionData(
          radius: 70,
          showTitle: true,
          color: kGraphColors[index],
          value: totals[index].total.toDouble(),
          title: _title(monthPersonSide, totals[index]),
          titleStyle: const TextStyle(fontSize: 13, color: Colors.white),
        ),
      );

  String _title(MonthPersonSide monthPersonSide, TotalModel model) {
    switch (monthPersonSide) {
      case MonthPersonSide.side:
        return "${model.spendingSide} \$${model.total}";
      case MonthPersonSide.month:
        return "${model.month} \$ {model.total}";
      case MonthPersonSide.person:
        return "${model.person} \$${model.total}";
    }
  }

  bool _isEmpty(List<TotalModel> totals) {
    int counter = 0;
    for (TotalModel model in totals) {
      if (model.total == 0) {
        counter++;
      }
    }
    if (counter == totals.length) {
      return true;
    } else {
      return false;
    }
  }
}
