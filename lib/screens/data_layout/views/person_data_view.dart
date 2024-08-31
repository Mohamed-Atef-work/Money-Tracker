import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/expenses_component.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';
import 'package:money_tracker/screens/data_layout/widgets/persons_data_widget.dart';

class PersonsDataView extends StatelessWidget {
  const PersonsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("PersonsDataView"),
        PersonsDataWidget(),
        ExpansesListViewWidget(expanses: expanses),
      ],
    );
  }
}

final model = ExpanseModel(
  month: "january",
  money: 30,
  person: "Mohamed",
  description:
      "When i was shopping i bought a coat and a lot of kilos of mango,then i went to the library and bought some book,then i went to the library and bought some book,then i went to the library and bought some book",
  spendingSide: "Shopping",
);

final expanses = [
  model,
  model,
  model,
  model,
  model,
  model,
  model,
  model,
  model,
];
