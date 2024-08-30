import 'package:money_tracker/core/utils/local/english.dart';

class Arabic {
  static String code = "ar";
  static String data = "بيانات";
  static String months = "شهور";
  static String persons = "اشخاص";
  static String expanses = "مصروفات";
  static String statistics = "احصائيات";
  static String appName = "متتبع المال";
  static String spendingSides = "أوجه الانفاق";
  static String addNewExpanse = "اضافة مصروف";

  static String may = "مايو";
  static String june = "يونيو";
  static String july = "يوليو";
  static String mars = "مارس";
  static String april = "ابريل";
  static String august = "اغسطس";
  static String october = "اكتوبر";
  static String january = "يناير";
  static String november = "نوفمبر";
  static String december = "ديسمبر";
  static String february = "فبراير";
  static String september = "سبتمبر";

  static Map<String, String> toMap() => {
        English.may: may,
        English.june: june,
        English.july: july,
        English.mars: mars,
        English.april: april,
        English.august: august,
        English.january: january,
        English.october: october,
        English.november: november,
        English.december: december,
        English.february: february,
        English.september: september,
        English.data: data,
        English.months: months,
        English.appName: appName,
        English.persons: persons,
        English.expanses: expanses,
        English.statistics: statistics,
        English.spendingSides: spendingSides,
        English.addNewExpanse: addNewExpanse,
      };
}
