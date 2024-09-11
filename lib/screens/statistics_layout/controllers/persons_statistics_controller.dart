import 'package:get/get.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class PersonsStatisticsController extends GetxController {
  final StatisticsRepo _repo;

  PersonsStatisticsController(this._repo);

  final personsSides = Get.find<PersonsSidesController>();

  RequestState dataState = RequestState.initial;

  List<TotalModel> personTotalEachMonth = [];
  List<TotalModel> eachPersonOfMonth = [];
  List<TotalModel> eachSideOfPersonOfMonth = [];

  Future<void> _personTotalEachMonth() async {
    final person = personsSides.persons[personsSides.selectedPerson];
    final ids =
        English.monthsList.map((month) => monthPerson(month, person)).toList();
    personTotalEachMonth = await _repo.getTotalsWithIds(ids);
    personTotalEachMonth.map((e) => print(e.toString())).toList();
  }

  Future<void> _eachPersonTotalOfMonth() async {
    final month = English.monthsList[personsSides.selectedMonth];
    final ids = personsSides.persons
        .map((person) => monthPerson(month, person))
        .toList();
    eachPersonOfMonth = await _repo.getTotalsWithIds(ids);
    eachPersonOfMonth.map((e) => print(e.toString())).toList();
  }

  Future<void> _eachSideTotalOfPersonOfMonth() async {
    final person = personsSides.persons[personsSides.selectedPerson];
    final month = English.monthsList[personsSides.selectedMonth];
    final ids = personsSides.sides
        .map((side) => monthPersonSide(month, person, side))
        .toList();
    eachSideOfPersonOfMonth = await _repo.getTotalsWithIds(ids);
    eachSideOfPersonOfMonth.map((e) => print(e.toString())).toList();
  }

  void getData() async {
    try {
      dataState = RequestState.loading;

      await _personTotalEachMonth();
      await _eachPersonTotalOfMonth();
      await _eachSideTotalOfPersonOfMonth();

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
