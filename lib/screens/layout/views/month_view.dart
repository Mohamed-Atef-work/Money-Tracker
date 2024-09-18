import '../widgets/view_helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/layout/widgets/months_menu.dart';
import 'package:money_tracker/screens/data_module/widgets/month_data.dart';
import 'package:money_tracker/screens/statistics_module/widgets/month_statistics.dart';

class MonthWidget extends StatelessWidget {
  const MonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewHelperWidget(
      menu: MonthMenuWidget(),
      data: MonthsDataWidget(),
      statistics: MonthsStatisticsWidget(),
    );
  }
}
