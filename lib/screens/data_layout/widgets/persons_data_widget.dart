import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/scrollable_row_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/persons_data_controller.dart';

class PersonsDataWidget extends StatelessWidget {
  const PersonsDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PersonsDataController>();
    return GetBuilder<PersonsDataController>(
      builder: (_) {
        return ScrollableRowComponent(
          titles: controller.persons,
          comingIndex: controller.currentPersonIndex,
          onTap: (chosenIndex) => controller.personIndex(chosenIndex),
        );
      },
    );
  }
}
