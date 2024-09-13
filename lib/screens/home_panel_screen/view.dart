import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/components/custom_button.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/core/config/routes/routes_strings.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo_impl.dart';

class HomePanelScreen extends StatelessWidget {
  const HomePanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
/*CustomButton(
              text: "test",
              onPressed: () async {
                final sqlServices = SqfliteServices();
                final repo = StatisticsRepoImpl(sqlServices);

                final response =
                    await repo.getTotalsWithIds(English.monthsList);
                response.map((e) => print(e.toString())).toList();

                */ /*final params = GetTotalWithIdsParams(
                  person: 'mo',
                  month: 'January',
                  side: 'Football',
                );
                final response = await repo.getTotalsWithIds(params);
                response.map((e) => print(e.toString())).toList();*/ /*
                */ /*final response = await sqlServices.getItemsWithValue(
                  tableName: kTotals,
                  columnsNames: [kId],
                  values: ["JanuaryFootball"],
                );*/ /*
                //response.map((e) => print(e)).toList();
                //print(response.map((e) => print(e)));
              },
            ),*/
