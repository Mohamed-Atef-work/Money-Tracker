import 'package:get/get.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/data_repo/data_repo.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/screens/data_module/controllers/person_sides_data_controller.dart';

class SpendingSidesDataController extends GetxController {
  final DataRepo _repo;

  SpendingSidesDataController(this._repo);

  RequestState requestState = RequestState.initial;

  final personsSides = Get.find<PersonsSidesController>();

  List<ExpanseModel> expanses = [];

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
    final spendingSide = personsSides.sides[personsSides.selectedSide];
    final month = English.monthsList[personsSides.selectedMonth];
    final params = GetExpansesParams(
      month: month,
      values: [spendingSide],
      columnNames: [kSpendingSide],
    );
    return params;
  }


  @override
  void onInit() {
    super.onInit();
    getExpanses();
  }
}
