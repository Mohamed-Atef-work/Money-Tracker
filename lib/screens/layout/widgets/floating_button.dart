import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/config/routes/routes_strings.dart';

class AddExpanseFloatingButtonWidget extends StatelessWidget {
  const AddExpanseFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: FloatingActionButton(
        backgroundColor: kWhiteGray,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () => Get.toNamed(Routes.addExpanse),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
