import 'package:get/get.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'views/month_view.dart';
import 'widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'views/spending_side_view.dart';
import 'package:money_tracker/core/components/app_bar.dart';
import 'package:money_tracker/screens/layout/controller.dart';
import 'package:money_tracker/screens/layout/views/person_view.dart';
import 'package:money_tracker/core/components/bottom_navigation_bar.dart';
import 'package:money_tracker/core/components/drop_down_menu_component.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          title: controller.titles[controller.index].tr,
          actions: [
            Padding(
              padding: kHorizontalPadding10,
              child: DropDownMenuComponent(
                items: controller.languagesCodes,
                selectedValue: controller.language,
                onChanged: (int? value) => controller.selectLanguage(value!),
              ),
            ),
          ],
        ),
        body: _body(controller.index),
        bottomNavigationBar: AppBottomNav(
          index: controller.index,
          onTap: (index) => controller.changeIndex(index),
        ),
        floatingActionButton: const AddExpanseFloatingButtonWidget(),
      ),
    );
  }
}

Widget _body(int index) {
  if (index == 0) {
    return const PersonWidget();
  } else if (index == 1) {
    return const SpendingSideWidget();
  } else {
    return const MonthWidget();
  }
}
