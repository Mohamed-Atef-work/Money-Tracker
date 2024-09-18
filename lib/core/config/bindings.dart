import 'package:get/get.dart';
import 'package:money_tracker/screens/layout/controller.dart';
import 'package:money_tracker/screens/add_expanse_screen/controller.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/repositories/data_repo/data_repo_impl.dart';
import 'package:money_tracker/screens/data_module/controllers/months_data_controller.dart';
import 'package:money_tracker/screens/data_module/controllers/persons_data_controller.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo_impl.dart';
import 'package:money_tracker/screens/add_expanse_screen/use_cases/add_expanse_use_case.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/data_module/controllers/spending_sides_data_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/months_statistics_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/persons_statistics_controller.dart';
import 'package:money_tracker/screens/statistics_module/controllers/spending_sides_statistics_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    final sqliteService = Get.put(SqfliteServices(), permanent: true);
    final dataRepo = Get.put(DataRepoImpl(sqliteService), permanent: true);
    final statRepo =
        Get.put(StatisticsRepoImpl(sqliteService), permanent: true);

    Get.put(PersonsSidesController(dataRepo), permanent: true);
    final addExpanse =
        Get.put(AddExpanseUseCase(dataRepo, statRepo), permanent: true);

    Get.put(LayoutController(), permanent: true);

    Get.lazyPut(() => MonthsDataController(dataRepo), fenix: true);
    Get.lazyPut(() => PersonsDataController(dataRepo), fenix: true);
    Get.lazyPut(() => SpendingSidesDataController(dataRepo), fenix: true);

    Get.lazyPut(() => MonthsStatisticsController(statRepo), fenix: true);
    Get.lazyPut(() => PersonsStatisticsController(statRepo), fenix: true);
    Get.lazyPut(() => SpendingSidesStatisticsController(statRepo), fenix: true);

    Get.lazyPut(() => AddExpanseController(addExpanse), fenix: true);
  }
}
