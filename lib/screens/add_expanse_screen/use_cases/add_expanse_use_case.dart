import 'package:money_tracker/screens/repositories/data_repo/data_repo.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/screens/repositories/models/totals_model.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo.dart';

class AddExpanseUseCase {
  final DataRepo _dataRepo;
  final StatisticsRepo _statRepo;

  AddExpanseUseCase(this._dataRepo, this._statRepo);

  Future<void> call(ExpanseModel expanse) async {
    final getParams = _getParams(expanse);
    final totals = await _statRepo.getTotalsBeforeAddingExpanse(getParams);

    final addParams = _addParams(expanse.money, totals);
    await _statRepo.addTotals(addParams);

    await _dataRepo.addExpanse(expanse);
  }

  GetTotalWithIdsParams _getParams(ExpanseModel expanse) =>
      GetTotalWithIdsParams(
        month: expanse.month,
        person: expanse.person,
        side: expanse.spendingSide,
      );

  AddTotalsParams _addParams(int money, List<TotalModel> totals) =>
      AddTotalsParams(
        totalModel: totals,
        expanseMoney: money,
      );
}
