import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/scrollable_row_component.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';
import 'package:money_tracker/screens/data_layout/widgets/expenses_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ExpanseModel(
      month: "january",
      money: 30,
      person: "Mohamed",
      description:
          "When i was shopping i bought a coat and a lot of kilos of mango,then i went to the library and bought some book,then i went to the library and bought some book,then i went to the library and bought some book",
      spendingSide: "Shopping",
    );
    return Scaffold(
      body: Center(
        child: ScrollableRowItemComponent(onTap: () {  }, title: 'fgh', isChosen: false,),
      ),
    );
  }
}
