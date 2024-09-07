import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/expenses_component.dart';
import 'package:money_tracker/core/components/messenger_component.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class MonthsDataView extends StatelessWidget {
  const MonthsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    final monthController = Get.find<MonthsDataController>();
    final personSideController = Get.find<PersonsSidesController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<PersonsSidesController>(
              builder: (controller) => DropDownMenuComponent(
                items: controller.translatedMonths,
                selectedValue: controller.selectedMonth,
                onChanged: (int? selected) => controller.selectMonth(selected!),
              ),
            ),
            CustomButton(
              text: English.search.tr,
              onPressed: () {
                final month =
                    English.monthsList[personSideController.selectedMonth];
                monthController.getExpanses(month);
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
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
