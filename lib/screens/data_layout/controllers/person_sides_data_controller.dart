import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';
import 'package:money_tracker/screens/data_layout/widgets/add_person_or_side_widget.dart';

class PersonsSidesDataController extends GetxController {
  final DataRepo _repo;

  PersonsSidesDataController(this._repo);

  List<PersonModel>? personsModel;
  List<SpendingSideModel>? sidesModel;

  List<String> sides = [English.loading.tr];
  List<String> persons = [English.loading.tr];

  int selectedSide = 0;
  int selectedMonth = 0;
  int selectedPerson = 0;

  final formKey = GlobalKey<FormState>();

  final sideOrPersonCon = TextEditingController();

  void showPersonSheet() {
    final sheet = AddPersonOrSideWidget(
      onPressed: addPerson,
      title: kPerson,
    );
    Get.bottomSheet(sheet);
  }

  void showSpendingSideSheet() {
    final sheet = AddPersonOrSideWidget(
      onPressed: addSpendingSide,
      title: kSpendingSide,
    );
    Get.bottomSheet(sheet);
  }

  void addPerson() async {
    if (formKey.currentState!.validate()) {
      final model = PersonModel(person: sideOrPersonCon.text);
      try {
        final models = await _repo.addPerson(model);
        sideOrPersonCon.text = '';
        update();
      } on LocalDataBaseException catch (exc) {}
    }
  }

  void addSpendingSide() async {
    if (formKey.currentState!.validate()) {
      final model = SpendingSideModel(spendingSide: sideOrPersonCon.text);
      try {
        final models = await _repo.addSpendingSide(model);
        sideOrPersonCon.text = '';
        update();
      } on LocalDataBaseException catch (exc) {}
    }
  }

  void getPersons() async {
    try {
      final models = await _repo.getPersons();
      if (models.isNotEmpty) {
        personsModel = models;
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
        sides = List.generate(
          sidesModel!.length,
          (index) => sidesModel![index].spendingSide,
        );
        update();
      }
    } on LocalDataBaseException catch (exc) {}
  }

  void selectPerson(int person) {
    selectedPerson = person;
    update();
  }

  void selectMonth(int month) {
    selectedMonth = month;
    update();
  }

  void selectSide(int side) {
    selectedSide = side;
    update();
  }

  List<String> translatedMonths = [
    English.january.tr,
    English.february.tr,
    English.mars.tr,
    English.april.tr,
    English.may.tr,
    English.june.tr,
    English.july.tr,
    English.august.tr,
    English.september.tr,
    English.october.tr,
    English.november.tr,
    English.december.tr
  ];

  @override
  void onInit() {
    super.onInit();

    getSides();
    getPersons();
  }
}
