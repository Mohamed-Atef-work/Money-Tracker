import 'package:get/get.dart';
import 'package:money_tracker/core/error/exceptions.dart';
import 'package:money_tracker/screens/data_layout/data_repo/data_repo.dart';
import 'package:money_tracker/screens/data_layout/models/person_model.dart';
import 'package:money_tracker/screens/data_layout/models/spending_side_model.dart';

class AddExpanseController extends GetxController {
  final DataRepo _repo ;

  AddExpanseController(this._repo);



  /*void addExpanses() async {
    try {
      final models = await _repo.addExpense();
      sides = models;
      update();
    } on LocalDataBaseException catch (exc) {}
  }*/


}
