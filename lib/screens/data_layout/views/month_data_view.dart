import 'package:flutter/cupertino.dart';
import 'package:money_tracker/screens/data_layout/widgets/months_data_widget.dart';

class MonthsDataView extends StatelessWidget {
  const MonthsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("data"),
        MonthsDataWidget(),
      ],
    );
  }
}
