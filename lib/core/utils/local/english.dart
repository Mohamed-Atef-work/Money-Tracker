
class English {
  static String code = "en";
  static String data = "Data";
  static String months = "Months";
  static String persons = "Persons";
  static String expanses = "expanses";
  static String statistics = "Statistics";
  static String appName = "Money Tracker";
  static String spendingSide = "Spending Side";
  static String addNewExpanse = "Add New Expanse";

  static Map<String, String> toMap() => {
        data: data,
        months: months,
        appName: appName,
        persons: persons,
        expanses: expanses,
        statistics: statistics,
        spendingSide: spendingSide,
        addNewExpanse: addNewExpanse,
      };
}
