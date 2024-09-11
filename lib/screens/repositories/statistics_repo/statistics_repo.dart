import 'package:money_tracker/core/utils/constants/constants.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';

abstract class StatisticsRepo {
  Future<List<TotalModel>> getTotals();
  Future<void> addTotals(AddTotalsParams params);
  Future<List<TotalModel>> getTotalsWithIds(List<String> ids);
  Future<List<TotalModel>> getTotalsBeforeAddingExpanse(
      GetTotalWithIdsParams params);
}

class AddTotalsParams {
  final int expanseMoney;
  List<TotalModel> totalModel;

  AddTotalsParams({
    required this.expanseMoney,
    required this.totalModel,
  });
}

class GetTotalWithIdsParams {
  final String person;
  final String month;
  final String side;

  late String monthPersonSideId;
  late String monthPersonId;
  late String monthSideId;

  GetTotalWithIdsParams({
    required this.person,
    required this.month,
    required this.side,
  }) {
    monthSideId = monthSide(month, side);
    monthPersonId = monthPerson(month, person);
    monthPersonSideId = monthPersonSide(month, person, side);
  }
}
