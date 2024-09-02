import 'package:get/get.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';

class MonthsDataController extends GetxController {
  final DataRepo _repo = Get.find<DataRepo>();

  int selectedMonth = 0;

  List<ExpanseModel> expanses = [];

  void getExpanses() async {
    try {
      final month = English.monthsList[selectedMonth];
      final models = await _repo.getMonthExpanses(month);
      expanses = models;
      update();
    } on LocalDataBaseException catch (exc) {}
  }

  void selectMonth(int index) {
    selectedMonth = index;
    update();
  }
}
