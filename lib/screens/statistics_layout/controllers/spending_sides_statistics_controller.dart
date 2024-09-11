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

  List<TotalModel> sideTotals = [];
  List<TotalModel> sidsOfMonthTotals = [];
  List<TotalModel> personsOfMonthTotals = [];

  Future<void> _selectedSideTotalOfEachMonths() async {
    final side = personsSides.sides[personsSides.selectedSide];
    final ids =
        English.monthsList.map((month) => monthSide(month, side)).toList();
    sideTotals = await _repo.getTotalsWithIds(ids);
    sideTotals.map((e) => print(e.toString())).toList();
  }

  Future<void> _eachSideTotalOfMonth() async {
    final month = English.monthsList[personsSides.selectedMonth];
    final ids =
        personsSides.sides.map((side) => monthSide(month, side)).toList();
    sidsOfMonthTotals = await _repo.getTotalsWithIds(ids);
    sidsOfMonthTotals.map((e) => print(e.toString())).toList();
  }

  Future<void> _eachPersonTotalOfSideInMonth() async {
    final side = personsSides.sides[personsSides.selectedSide];
    final month = English.monthsList[personsSides.selectedMonth];
    final ids = personsSides.persons
        .map((persons) => monthPersonSide(month, persons, side))
        .toList();
    personsOfMonthTotals = await _repo.getTotalsWithIds(ids);
    personsOfMonthTotals.map((e) => print(e.toString())).toList();
  }

  void getData() async {
    try {
      dataState = RequestState.loading;

      await _eachSideTotalOfMonth();
      await _eachPersonTotalOfSideInMonth();
      await _selectedSideTotalOfEachMonths();

      dataState = RequestState.success;
    } on LocalDataBaseException catch (exc) {
      dataState = RequestState.error;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
