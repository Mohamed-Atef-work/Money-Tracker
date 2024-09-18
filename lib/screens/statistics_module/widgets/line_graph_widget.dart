import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';

class StatisticsLineGraphWidget extends StatelessWidget {
  final String leftTitle;
  final List<TotalModel> totals;

  const StatisticsLineGraphWidget({
    super.key,
    required this.totals,
    required this.leftTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.3,
      padding: kHorizontalPadding15,
      child: LineChart(
        LineChartData(
          minY: 0,
          //maxX: 11,
          lineBarsData: [
            LineChartBarData(
              barWidth: 2,
              colors: kGraphColors,
              spots: _spots(),
            ),
          ],
          titlesData: FlTitlesData(
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: _getBottomTitles,
              getTextStyles: (_, __) => const TextStyle(fontSize: 10),
            ),
          ),
          axisTitleData: FlAxisTitleData(
            leftTitle: AxisTitle(
                titleText: "${English.total.tr} (${leftTitle.tr})",
                showTitle: true),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _spots() => List.generate(
        totals.length,
        (index) => FlSpot(
          index.toDouble(),
          totals[index].total.toDouble(),
        ),
      );

  String _getBottomTitles(double value) {
    final month = English.monthsList[value.toInt()].tr;
    final reducedMonth = month[0] + month[1] + month[2];
    return reducedMonth;
  }
}
