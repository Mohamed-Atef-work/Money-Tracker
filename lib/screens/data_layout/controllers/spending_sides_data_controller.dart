import 'package:get/get.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/data_repo/data_repo.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class SpendingSidesDataController extends GetxController {
  final DataRepo _repo;

  SpendingSidesDataController(this._repo);

  List<ExpanseModel> expanses = [];

  void getExpanses() async {
    try {
      final params = _params();
      final models = await _repo.getExpansesOfMonthAndSomeOther(params);
      expanses = models;
      if (models.isEmpty) {
        expanses.clear();
      }
      update();
    } on LocalDataBaseException catch (exc) {
      print("error is ---------------> ${exc.message}");
    }
  }

  GetExpansesParams _params() {
    final personsSides = Get.find<PersonsSidesController>();
    final spendingSide = personsSides.sides[personsSides.selectedSide];
    final month = English.monthsList[personsSides.selectedMonth];
    final params = GetExpansesParams(
      month: month,
      values: [spendingSide],
      columnNames: [kSpendingSide],
    );
    return params;
  }
}
