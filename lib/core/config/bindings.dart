import 'package:get/get.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/add_expanse_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/data_layout_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/months_data_view_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/persons_data_controller.dart';
import 'package:money_tracker/screens/data_layout/controllers/spending_sides_data_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataLayoutController>(() => DataLayoutController(),
        fenix: true);
    Get.lazyPut<MonthsDataController>(() => MonthsDataController(),
        fenix: true);
    Get.lazyPut<PersonsDataController>(() => PersonsDataController(),
        fenix: true);
    Get.lazyPut<SpendingSidesDataController>(
        () => SpendingSidesDataController(),
        fenix: true);
    Get.lazyPut<AddExpanseController>(() => AddExpanseController(),
        fenix: true);
  }
}
