import 'package:get/get.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';

class PersonsSidesDataController extends GetxController {
  final DataRepo _repo;

  PersonsSidesDataController(this._repo);

  List<String> sides = [English.loading.tr];
  List<String> persons = [English.loading.tr];

  List<PersonModel>? personsModel;
  List<SpendingSideModel>? sidesModel;

  String selectedSide = English.loading.tr;
  String selectedMonth = English.loading.tr;
  String selectedPerson = English.loading.tr;

  void selectPerson(String person) {
    selectedPerson = person;
    update();
  }

  void selectMonth(String month) {
    selectedMonth = month;
    update();
  }

  void selectSide(String side) {
    selectedSide = side;
    update();
  }

  void getPersons() async {
    try {
      final models = await _repo.getPersons();
      if (models.isNotEmpty) {
        personsModel = models;
        selectedPerson = personsModel!.first.person;
        persons = List.generate(
          personsModel!.length,
          (index) => personsModel![index].person,
        );
        update();
      }
    } on LocalDataBaseException catch (exc) {}
  }

  void getSides() async {
    try {
      final models = await _repo.getSpendingSides();
      if (models.isNotEmpty) {
        sidesModel = models;
        selectedSide = sidesModel!.first.spendingSide;
        sides = List.generate(
          models.length,
          (index) => sidesModel![index].spendingSide,
        );
        update();
      }
    } on LocalDataBaseException catch (exc) {}
  }

  @override
  void onInit() {
    super.onInit();

    getPersons();
    getSides();
  }
}
