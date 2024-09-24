import 'package:flutter/material.dart';
import '../widgets/view_helper_widget.dart';
import 'package:money_tracker/screens/layout/widgets/person_menu.dart';
import 'package:money_tracker/screens/data_module/widgets/person_data.dart';
import 'package:money_tracker/screens/statistics_module/widgets/person_statistics.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewHelperWidget(
      menu: PersonMenuWidget(),
      data: PersonsDataWidget(),
      statistics: PersonsStatisticsWidget(),
    );
  }
}
