import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:money_tracker/core/utils/enums.dart';
import 'package:money_tracker/core/utils/extensions.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/screens/data_layout/use_cases/add_expanse_use_case.dart';
import 'package:money_tracker/screens/data_layout/controllers/person_sides_data_controller.dart';

class AddExpanseController extends GetxController {
  final AddExpanseUseCase _addExpanse;

  AddExpanseController(this._addExpanse);

  RequestState expanseState = RequestState.initial;

  final formKey = GlobalKey<FormState>();

  final moneyCon = TextEditingController();
  final descriptionCon = TextEditingController();

  void addExpanses() async {
    if (formKey.currentState!.validate()) {
      expanseState = RequestState.loading;
      update();
      final expanse = _expanseModel();
      try {
        await _addExpanse.call(expanse);
        expanseState = RequestState.success;
        await delayedUpdate();
        moneyCon.text = "";
        descriptionCon.text = "";
      } on LocalDataBaseException catch (exc) {
        expanseState = RequestState.error;
        update();
      }
    }
  }

  ExpanseModel _expanseModel() {
    final personsSidesCon = Get.find<PersonsSidesController>();
    final model = ExpanseModel(
      money: int.parse(moneyCon.text),
      description: descriptionCon.text,
      month: English.monthsList[personsSidesCon.selectedMonth],
      person: personsSidesCon.persons[personsSidesCon.selectedPerson],
      spendingSide: personsSidesCon.sides[personsSidesCon.selectedSide],
    );
    return model;
  }
}
