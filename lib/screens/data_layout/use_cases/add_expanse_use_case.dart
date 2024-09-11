import 'package:money_tracker/screens/repositories/data_repo/data_repo.dart';
import 'package:money_tracker/screens/repositories/models/expanse_model.dart';
import 'package:money_tracker/screens/repositories/statistics_repo/statistics_repo.dart';

class AddExpanseUseCase {
  final DataRepo _dataRepo;
  final StatisticsRepo _statisticsRepo;

  AddExpanseUseCase(this._dataRepo, this._statisticsRepo);

  Future<void> call(ExpanseModel expanse) async {
    await _dataRepo.addExpanse(expanse);

    final params = _params(expanse);
    final totals = await _statisticsRepo.getTotalsBeforeAddingExpanse(params);

    final addTotalsParams = AddTotalsParams(
      expanseMoney: expanse.money,
      totalModel: totals,
    );
    await _statisticsRepo.addTotals(addTotalsParams);
  }

  GetTotalWithIdsParams _params(ExpanseModel expanse) => GetTotalWithIdsParams(
        side: expanse.spendingSide,
        person: expanse.person,
        month: expanse.month,
      );
}
