import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/scrollable_row_component.dart';
import 'package:money_tracker/screens/data_layout/controllers/spending_sides_data_controller.dart';

class SpendingSIdesDataWidget extends StatelessWidget {
  const SpendingSIdesDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SpendingSidesDataController>();
    return GetBuilder<SpendingSidesDataController>(
      builder: (_) {
        return ScrollableRowComponent(
          titles: controller.spendingSides,
          comingIndex: controller.selectedSide,
          onTap: (chosenIndex) => controller.selectSide(chosenIndex),
        );
      },
    );
  }
}
