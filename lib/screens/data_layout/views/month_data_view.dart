import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/core/components/expenses_component.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';

class MonthsDataView extends StatelessWidget {
  const MonthsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MonthsDataController>(
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropDownMenuComponent(
                items: English.monthsList,
                selectedValue: controller.selectedMonth,
                onChanged: (int? selected) => controller.selectMonth(selected!),
              ),
              CustomButton(
                text: English.search.tr,
                onPressed: () => controller.getExpanses(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ExpansesListViewWidget(controller.expanses),
        ],
      ),
    );
  }
}
