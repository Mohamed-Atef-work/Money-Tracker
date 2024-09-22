import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/loading_widget.dart';
import 'package:money_tracker/core/components/expenses_component.dart';
import 'package:money_tracker/core/components/messenger_component.dart';
import 'package:money_tracker/screens/data_module/controllers/months_data_controller.dart';

class MonthsDataWidget extends StatelessWidget {
  const MonthsDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MonthsDataController>(
      builder: (controller) {
        if (controller.requestState == RequestState.loading) {
          return const LoadingWidget();
        } else if (controller.requestState == RequestState.success &&
            controller.expanses.isNotEmpty) {
          return ExpansesListViewWidget(controller.expanses);
        } else {
          return MessengerComponent(English.thereIsNoData.tr);
        }
      },
    );
  }
}
