import 'package:get/get.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/expanse_model.dart';

import 'person_sides_data_controller.dart';

class PersonsDataController extends GetxController {
  final DataRepo _repo;

  PersonsDataController(this._repo);

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
    final month = English.monthsList[personsSides.selectedMonth];
    final person = personsSides.persons[personsSides.selectedPerson];

    final params = GetExpansesParams(
      month: month,
      values: [person],
      columnNames: [kPerson],
    );
    return params;
  }
}
