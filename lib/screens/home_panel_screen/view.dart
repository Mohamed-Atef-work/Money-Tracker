import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/config/routes/routes_strings.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/statistics_layout/repo/statistics_repo.dart';
import 'package:money_tracker/screens/statistics_layout/repo/statistics_repo_impl.dart';

class HomePanelScreen extends StatelessWidget {
  const HomePanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            text: English.addExpanse.tr,
            onPressed: () => Get.toNamed(Routes.addExpanse),
          ),
          CustomButton(
            text: English.data.tr,
            onPressed: () => Get.toNamed(Routes.dataLayout),
          ),
          CustomButton(
            text: English.statistics.tr,
            onPressed: () => Get.toNamed(Routes.statisticsLayout),
          ),
          CustomButton(
            text: "test",
            onPressed: () async {
              final sqlServices = SqfliteServices();
              final repo = StatisticsRepoImpl(sqlServices);
              final params = GetTotalWithIdsParams(
                  person: 'mo', month: "January", side: 'shopping');
              final response = await repo.getTotalsWithIds(params);
              print(response.map((e) => print(e)));
            },
          ),
        ],
      ),
    );
  }
}
