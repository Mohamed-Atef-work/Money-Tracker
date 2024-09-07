import 'package:get/get.dart';
import 'package:money_tracker/screens/statistics_layout/controller.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo_impl.dart';
import 'package:money_tracker/screens/statistics_layout/repo/statistics_repo_impl.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/data_layout_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/persons_data_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/spending_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/persons_statistics_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/months_statistics_view_controller.dart';
import 'package:money_tracker/screens/statistics_layout/controllers/spending_sides_statistics_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    final sqliteService = Get.put(SqfliteServices(), permanent: true);
    final dataRepo = Get.put(DataRepoImpl(sqliteService), permanent: true);
    final statRepo =
        Get.put(StatisticsRepoImpl(sqliteService), permanent: true);

    Get.put(PersonsSidesController(dataRepo), permanent: true);

    Get.put(DataLayoutController(), permanent: true);
    Get.put(StatisticsLayoutController(), permanent: true);

    Get.lazyPut(() => MonthsDataController(dataRepo), fenix: true);
    Get.lazyPut(() => PersonsDataController(dataRepo), fenix: true);
    Get.lazyPut(() => SpendingSidesDataController(dataRepo), fenix: true);

    Get.lazyPut(() => MonthsStatisticsController(statRepo), fenix: true);
    Get.lazyPut(() => PersonsStatisticsController(statRepo), fenix: true);
    Get.lazyPut(() => SpendingSidesStatisticsController(statRepo), fenix: true);

    Get.lazyPut(() => AddExpanseController(dataRepo), fenix: true);
  }
}
