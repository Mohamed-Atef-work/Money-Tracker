import 'package:money_tracker/core/utils/local/local_constants.dart';
import 'package:money_tracker/core/utils/local/local_interface.dart';

class English implements AppLocal {
  @override
  String data = "Data";

  @override
  String months = "Months";

  @override
  String persons = "Persons";

  @override
  String revenues = "Revenues";

  @override
  String statistics = "Statistics";

  @override
  String appName = "Money Tracker";

  @override
  String addNewRevenue = "Add New Revenue";

  @override
  Map<String, String> toMap() => {
        data: data,
        months: months,
        appName: appName,
        persons: persons,
        revenues: revenues,
        statistics: statistics,
        addNewRevenue: addNewRevenue,
      };
}
