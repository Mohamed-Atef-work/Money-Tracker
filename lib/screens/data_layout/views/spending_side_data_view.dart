import 'package:flutter/material.dart';
import 'package:money_tracker/screens/data_layout/widgets/spending_sides_data_widget.dart';

class SpendingSidesDataView extends StatelessWidget {
  const SpendingSidesDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("spending Sides"),
        SpendingSIdesDataWidget(),
      ],
    );
  }
}
