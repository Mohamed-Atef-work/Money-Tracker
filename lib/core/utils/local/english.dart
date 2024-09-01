import 'package:get/get.dart';

class English {
  static String code = "en";

  static String may = "May";
  static String june = "June";
  static String july = "July";
  static String mars = "Mars";
  static String april = "April";
  static String august = "August";
  static String october = "October";
  static String january = "January";
  static String november = "November";
  static String december = "December";
  static String february = "February";
  static String september = "September";

  static String data = "Data";
  static String money = "Money";
  static String search = "search";
  static String months = "Months";
  static String person = "Person";
  static String persons = "Persons";
  static String expanses = "expanses";
  static String statistics = "Statistics";
  static String appName = "Money Tracker";
  static String addExpanse = "Add Expanse";
  static String description = "Description";
  static String spendingSides = "Spending Sides";

  static List<String> monthsList = [
    English.january.tr,
    English.february.tr,
    English.mars.tr,
    English.april.tr,
    English.may.tr,
    English.june.tr,
    English.july.tr,
    English.august.tr,
    English.september.tr,
    English.october.tr,
    English.november.tr,
    English.december.tr
  ];

  static Map<String, String> toMap() => {
        may: may,
        june: june,
        july: july,
        mars: mars,
        april: april,
        august: august,
        january: january,
        october: october,
        november: november,
        december: december,
        february: february,
        september: september,
        data: data,
        money: money,
        search: search,
        person: person,
        months: months,
        appName: appName,
        persons: persons,
        expanses: expanses,
        addExpanse: addExpanse,
        statistics: statistics,
        description: description,
        spendingSides: spendingSides,
      };
}
