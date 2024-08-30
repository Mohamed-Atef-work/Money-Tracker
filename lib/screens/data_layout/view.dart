import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/core/components/bottom_navigation_bar.dart';
import 'package:money_tracker/screens/data_layout/controller.dart';

class DataLayoutScreen extends StatelessWidget {
  const DataLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataLayoutController>();
    return GetBuilder<DataLayoutController>(
      builder: (_) {
        return Scaffold(
          appBar: CustomAppBar(
            title: controller.titles[controller.index],
          ),
          body: Column(),
          bottomNavigationBar: AppBottomNav(
            index: controller.index,
            onTap: (index) {
              controller.currentIndex(index);
            },
          ),
        );
      },
    );
  }
}
