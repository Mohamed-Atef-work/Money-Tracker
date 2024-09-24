import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/screens/repositories/data_repo/data_repo.dart';
import 'package:money_tracker/screens/repositories/models/person_model.dart';
import 'package:money_tracker/screens/repositories/models/spending_side_model.dart';
import 'package:money_tracker/screens/add_expanse_screen/widgets/add_person_or_side_widget.dart';

class PersonsSidesController extends GetxController {
  final DataRepo _repo;

  PersonsSidesController(this._repo);

  RequestState addPersonOrSideState = RequestState.initial;
  RequestState addExpanseState = RequestState.initial;

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
    Widget sheet = AddPersonOrSideWidget(
      onPressed: addPerson,
      title: English.person.tr,
    );
    Get.bottomSheet(sheet);
  }

  void showSpendingSideSheet() {
    Widget sheet = AddPersonOrSideWidget(
      onPressed: addSpendingSide,
      title: English.spendingSide.tr,
    );
    Get.bottomSheet(sheet);
  }

  void addPerson() async {
    if (formKey.currentState!.validate()) {
      try {
        addPersonOrSideState = RequestState.loading;
        update();

        final model = PersonModel(person: sideOrPersonCon.text);
        await _repo.addPerson(model);

        persons.add(sideOrPersonCon.text);
        sideOrPersonCon.text = '';
        addPersonOrSideState = RequestState.success;
        await delayedUpdate();
      } on LocalDataBaseException catch (exc) {
        addPersonOrSideState = RequestState.error;
        await delayedUpdate();
      }
    }
  }

  void addSpendingSide() async {
    if (formKey.currentState!.validate()) {
      try {
        addPersonOrSideState = RequestState.loading;
        update();

        final model = SpendingSideModel(spendingSide: sideOrPersonCon.text);
        await _repo.addSpendingSide(model);

        sides.add(sideOrPersonCon.text);
        sideOrPersonCon.text = '';

        addPersonOrSideState = RequestState.success;
        await delayedUpdate();
      } on LocalDataBaseException catch (exc) {
        addPersonOrSideState = RequestState.error;
        await delayedUpdate();
      }
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


  @override
  void onInit() {
    super.onInit();

    getSides();
    getPersons();
  }
}
