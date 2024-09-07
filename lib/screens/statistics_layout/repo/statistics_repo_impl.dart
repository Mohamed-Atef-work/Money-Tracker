import 'package:money_tracker/core/utils/services/sqflite/sqflite_services.dart';
import 'package:money_tracker/screens/statistics_layout/repo/statistics_repo.dart';

class StatisticsRepoImpl implements StatisticsRepo{
  final SqfliteServices _services;

  StatisticsRepoImpl(this._services);
}