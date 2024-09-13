import 'package:get/get.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class MonthsStatisticsController extends GetxController {
  final StatisticsRepo _repo;
  MonthsStatisticsController(this._repo);

  final personsSides = Get.find<PersonsSidesController>();

  RequestState dataState = RequestState.initial;

  List<TotalModel> eachMonthTotal = [];
  List<TotalModel> eachSideTotal = [];
  List<TotalModel> eachPersonTotal = [];

  Future<void> _eachMonthTotal() async {
    eachMonthTotal = await _repo.getTotalsWithIds(English.monthsList);
    eachMonthTotal.map((e) => print(e.toString())).toList();
  }

  Future<void> eachSideTotalOfMonth() async {
    final month = English.monthsList[personsSides.selectedMonth];
    final ids =
        personsSides.sides.map((side) => monthSide(month, side)).toList();
    eachSideTotal = await _repo.getTotalsWithIds(ids);
    eachSideTotal.map((e) => print(e.toString())).toList();
  }

  Future<void> _eachPersonTotalOfMonth() async {
    final month = English.monthsList[personsSides.selectedMonth];
    final ids = personsSides.persons
        .map((persons) => monthPerson(month, persons))
        .toList();
    eachPersonTotal = await _repo.getTotalsWithIds(ids);
    eachPersonTotal.map((e) => print(e.toString())).toList();
  }

  void getData() async {
    try {
      dataState = RequestState.loading;
      update();

      await _eachMonthTotal();
      await _eachPersonTotalOfMonth();
      await eachSideTotalOfMonth();

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
