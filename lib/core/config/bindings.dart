import 'package:get/get.dart';
import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo_impl.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/data_layout_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/persons_data_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/spending_sides_data_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    final sqliteService = Get.put(SqfliteServices(), permanent: true);
    final datRepo = Get.put(DataRepoImpl(sqliteService), permanent: true);

    Get.put(PersonsSidesDataController(datRepo), permanent: true);

    Get.lazyPut(() => DataLayoutController(), fenix: true);
    Get.lazyPut(() => PersonsDataController(), fenix: true);
    Get.lazyPut(() => MonthsDataController(datRepo), fenix: true);
    Get.lazyPut(() => SpendingSidesDataController(), fenix: true);
    Get.lazyPut(() => AddExpanseController(datRepo), fenix: true);
  }
}
