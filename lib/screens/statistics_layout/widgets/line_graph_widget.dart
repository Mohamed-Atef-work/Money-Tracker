import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:money_tracker/core/config/local/english.dart';

class StatisticsLineGraphWidget extends StatelessWidget {
  final String leftTitle;

  final List<FlSpot> spots;

  const StatisticsLineGraphWidget({
    super.key,
    required this.spots,
    required this.leftTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      child: LineChart(
        LineChartData(
          minY: 0,
          //maxX: 11,
          lineBarsData: [
            LineChartBarData(
              barWidth: 2,
              //colors: [kDarkBrown],
              spots: spots,
            ),
          ],
          titlesData: FlTitlesData(
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: _getBottomTitles,
              getTextStyles: (context, value) => const TextStyle(fontSize: 10),
            ),
          ),
          axisTitleData: FlAxisTitleData(
            leftTitle: AxisTitle(
                titleText: "${English.total.tr} (${leftTitle.tr})",
                showTitle: true),
            bottomTitle: AxisTitle(
              showTitle: true,
              titleText: English.month.tr,
            ),
          ),
        ),
      ),
    );
  }

  String _getBottomTitles(double value) {
    final month = English.monthsList[value.toInt()].tr;
    final reducedMonth = month[0] + month[1] + month[2];
    return reducedMonth;
  }
}
