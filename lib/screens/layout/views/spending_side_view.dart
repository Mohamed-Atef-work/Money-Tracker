import '../widgets/view_helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/screens/layout/widgets/spending_side_menu.dart';
import 'package:money_tracker/screens/data_module/widgets/spending_side_data.dart';
import 'package:money_tracker/screens/statistics_module/widgets/spending_side_statistics.dart';

class SpendingSideWidget extends StatelessWidget {
  const SpendingSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewHelperWidget(
      data: SpendingSidesDataWidget(),
      menu: SpendingSideMenuWidget(),
      statistics: SpendingSidesStatisticsWidget(),
    );
  }
}
