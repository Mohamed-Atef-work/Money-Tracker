import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/expenses_component.dart';
import 'package:money_tracker/core/components/messenger_component.dart';
import 'package:money_tracker/screens/data_module/controllers/months_data_controller.dart';

class MonthsDataWidget extends StatelessWidget {
  const MonthsDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<MonthsDataController>(
          builder: (controller) {
            if (controller.expanses.isEmpty) {
              return MessengerComponent(English.thereIsNoData.tr);
            } else {
              return ExpansesListViewWidget(controller.expanses);
            }
          },
        ),
      ],
    );
  }
}
