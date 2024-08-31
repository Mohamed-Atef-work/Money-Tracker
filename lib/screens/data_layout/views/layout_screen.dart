import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/core/components/bottom_navigation_bar.dart';
import 'package:money_tracker/screens/data_layout/views/month_data_view.dart';
import 'package:money_tracker/screens/data_layout/views/person_data_view.dart';
import 'package:money_tracker/screens/data_layout/views/spending_side_data_view.dart';
import 'package:money_tracker/screens/data_layout/controllers/data_layout_controller.dart';

class DataLayoutScreen extends StatelessWidget {
  const DataLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataLayoutController>();
    return GetBuilder<DataLayoutController>(
      builder: (_) {
        return Scaffold(
          appBar: CustomAppBar(title: controller.titles[controller.index]),
          body: _body(controller.index),
          bottomNavigationBar: AppBottomNav(
            index: controller.index,
            onTap: (index) => controller.currentIndex(index),
          ),
        );
      },
    );
  }

  Widget _body(int index) {
    if (index == 0) {
      return const PersonsDataView();
    } else if (index == 1) {
      return const SpendingSidesDataView();
    } else {
      return const MonthsDataView();
    }
  }
}
