import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/months_statistics_controller.dart';

class MonthsStatisticsView extends StatelessWidget {
  const MonthsStatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
