import 'package:get/get.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/screens/repositories/data_repo/data_repo.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';

class MonthsDataController extends GetxController {
  final DataRepo _repo;
  MonthsDataController(this._repo);
  List<ExpanseModel> expanses = [];

  RequestState requestState = RequestState.initial;

  void getExpanses(String month) async {
    requestState = RequestState.loading;
    update();
    try {
      final models = await _repo.getMonthExpanses(month);
      expanses = models;
      if (models.isEmpty) {
        expanses.clear();
      }
      requestState = RequestState.success;
      await delayedUpdate();
    } on LocalDataBaseException catch (exc) {
      requestState = RequestState.error;
      await delayedUpdate();

      print("error is ---------> ${exc.toString()}");
    }
  }
}
