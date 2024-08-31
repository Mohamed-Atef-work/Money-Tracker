import 'package:flutter/material.dart';
import 'package:money_tracker/screens/data_layout/widgets/persons_data_widget.dart';

class PersonsDataView extends StatelessWidget {
  const PersonsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("PersonsDataView"),
        PersonsDataWidget(),

      ],
    );
  }
}
