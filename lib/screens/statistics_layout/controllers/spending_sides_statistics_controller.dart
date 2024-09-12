import 'package:get/get.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class SpendingSidesStatisticsController extends GetxController {
  final StatisticsRepo _repo;

  SpendingSidesStatisticsController(this._repo);

  final personsSides = Get.find<PersonsSidesController>();

  RequestState dataState = RequestState.initial;

  List<TotalModel> sideEachMonth = [];
  List<TotalModel> eachSideOfMonth = [];
  List<TotalModel> eachPersonTotalOfSideInMonth = [];

  Future<void> _selectedSideTotalOfEachMonths() async {
    print("side eachMonth length ---------> ${sideEachMonth.length}");

    final side = personsSides.sides[personsSides.selectedSide];
    final ids =
        English.monthsList.map((month) => monthSide(month, side)).toList();
    sideEachMonth = await _repo.getTotalsWithIds(ids);
    sideEachMonth.map((e) => print(e.toString())).toList();
    print("side eachMonth length ---------> ${sideEachMonth.length}");
  }

  Future<void> _eachSideTotalOfMonth() async {
    final month = English.monthsList[personsSides.selectedMonth];
    final ids =
        personsSides.sides.map((side) => monthSide(month, side)).toList();
    eachSideOfMonth = await _repo.getTotalsWithIds(ids);
    eachSideOfMonth.map((e) => print(e.toString())).toList();
  }

  Future<void> _eachPersonTotalOfSideInMonth() async {
    final side = personsSides.sides[personsSides.selectedSide];
    final month = English.monthsList[personsSides.selectedMonth];
    final ids = personsSides.persons
        .map((persons) => monthPersonSide(month, persons, side))
        .toList();
    eachPersonTotalOfSideInMonth = await _repo.getTotalsWithIds(ids);
    eachPersonTotalOfSideInMonth.map((e) => print(e.toString())).toList();
  }

  void getData() async {
    try {
      dataState = RequestState.loading;
      update();

      await _eachSideTotalOfMonth();
      await _eachPersonTotalOfSideInMonth();
      await _selectedSideTotalOfEachMonths();

      dataState = RequestState.success;
      update();
    } on LocalDataBaseException catch (exc) {
      dataState = RequestState.error;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
