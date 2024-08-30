import 'package:money_tracker/core/utils/local/english.dart';

class Arabic {
  static String code = "ar";
  static String data = "بيانات";
  static String months = "شهور";
  static String persons = "اشخاص";
  static String expanses = "مصروفات";
  static String statistics = "احصائيات";
  static String appName = "متتبع المال";
  static String spendingSide = "أوجه الانفاق";
  static String addNewExpanse = "اضافة مصروف";

  static Map<String, String> toMap() => {
        English.data: data,
        English.months: months,
        English.appName: appName,
        English.persons: persons,
        English.expanses: expanses,
        English.statistics: statistics,
        English.spendingSide: spendingSide,
        English.addNewExpanse: addNewExpanse,
      };
}
