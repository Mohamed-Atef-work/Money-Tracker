import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/utils/local/local_constants.dart';
import 'package:money_tracker/core/utils/local/local_interface.dart';

class Arabic implements AppLocal {
  final english = English();
  @override
  String data = "بيانات";

  @override
  String months = "شهور";

  @override
  String persons = "اشخاص";

  @override
  String revenues = "مصروفات";

  @override
  String statistics = "احصائيات";

  @override
  String appName = "متتبع المال";

  @override
  String addNewRevenue = "اضافة مصروف";

  @override
  Map<String, String> toMap() => {
        english.data: data,
        english.months: months,
        english.appName: appName,
        english.persons: persons,
        english.revenues: revenues,
        english.statistics: statistics,
        english.addNewRevenue: addNewRevenue,
      };
}
