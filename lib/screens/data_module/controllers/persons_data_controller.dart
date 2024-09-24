import 'package:get/get.dart';
import 'person_sides_data_controller.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/data_repo/data_repo.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';

class PersonsDataController extends GetxController {
  final DataRepo _repo;

  PersonsDataController(this._repo);
  List<ExpanseModel> expanses = [];
  final personsSides = Get.find<PersonsSidesController>();

  RequestState requestState = RequestState.initial;

  void getExpanses() async {
    requestState = RequestState.loading;
    update();
    try {
      final params = _params();
      final models = await _repo.getExpansesOfMonthAndSomeOther(params);
      expanses = models;
      if (models.isEmpty) {
        expanses.clear();
      }
      requestState = RequestState.success;
      await delayedUpdate();
    } on LocalDataBaseException catch (exc) {
      requestState = RequestState.error;
      await delayedUpdate();
      print("error is ---------------> ${exc.message}");
    }
  }

  GetExpansesParams _params() {
    final month = English.monthsList[personsSides.selectedMonth];
    final person = personsSides.persons[personsSides.selectedPerson];

    final params = GetExpansesParams(
      month: month,
      values: [person],
      columnNames: [kPerson],
    );
    return params;
  }


  @override
  void onInit() {
    super.onInit();
    getExpanses();
  }
}
