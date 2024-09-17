import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
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
    final sections = List.generate(
      totals.length,
      (index) => PieChartSectionData(
        radius: 70,
        showTitle: true,
        value: totals[index].total.toDouble(),
        title: _title(monthPersonSide, totals[index]),
        titleStyle: const TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
    return SizedBox(
      width: context.width * 0.4,
      height: context.height * 0.3,
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              swapAnimationCurve: Curves.linear,
              swapAnimationDuration: kDuration1Second,
              PieChartData(sections: sections, centerSpaceRadius: 10),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }

  String _title(MonthPersonSide monthPersonSide, TotalModel model) {
    switch (monthPersonSide) {
      case MonthPersonSide.side:
        return model.id;
      case MonthPersonSide.month:
        return model.month;
      case MonthPersonSide.person:
        return model.person;
    }
  }
}
