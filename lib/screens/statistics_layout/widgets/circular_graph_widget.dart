import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';

class CircularGraphWidget extends StatelessWidget {
  final String title;
  final List<TotalModel> totals;
  const CircularGraphWidget({
    super.key,
    required this.title,
    required this.totals,
  });

  @override
  Widget build(BuildContext context) {
    final sections = List.generate(
      totals.length,
      (index) => PieChartSectionData(
        radius: 70,
        showTitle: true,
        title: totals[index].id,
        value: totals[index].total.toDouble(),
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
              PieChartData(
                sections: sections,
                centerSpaceRadius: 10,
              ),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}

List<Color> colorsss = [
  Colors.yellow,
  Colors.brown,
  Colors.blue,
  Colors.amber,
  Colors.red,
  Colors.blue,
  Colors.amber,
  Colors.red,
];
