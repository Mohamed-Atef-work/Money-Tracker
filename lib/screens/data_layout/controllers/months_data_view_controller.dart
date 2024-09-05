import 'package:get/get.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';

class MonthsDataController extends GetxController {
  final DataRepo _repo;
  MonthsDataController(this._repo);
  List<ExpanseModel> expanses = [];

  void getExpanses(String month) async {
    try {
      final models = await _repo.getMonthExpanses(month);
      expanses = models;
      if (models.isEmpty) {
        expanses.clear();
      }
      update();
    } on LocalDataBaseException catch (exc) {
      print("error is ---------> ${exc.toString()}");
    }
  }
}
