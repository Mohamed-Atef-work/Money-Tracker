import 'package:money_tracker/core/utils/local/english.dart';

class Arabic {
  static String code = "ar";
  static String search = "ابحث";
  static String data = "بيانات";
  static String months = "شهور";
  static String money = "المال";
  static String person = "الشخص";
  static String persons = "اشخاص";
  static String expanses = "مصروفات";
  static String description = "الوصف";
  static String loading = "جار التحمبل";
  static String statistics = "احصائيات";
  static String appName = "متتبع المال";
  static String addExpanse = "اضافة مصروف";
  static String spendingSides = "أوجه الانفاق";

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

  static String databaseIsClosed = "Database is closed.";
  static String tableDoesNotExist = "Table does not exist.";
  static String unknownDatabaseError = "Unknown database error:";
  static String syntaxErrorInSQLQuery = "Syntax error in SQL query.";
  static String failedToOpenTheDatabase = "Failed to open the database.";
  static String uniqueConstraintViolation = "Unique constraint violation.";
  static String databaseIsInReadOnlyMode = "Database is in read-only mode.";

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
        English.money: money,
        English.search: search,
        English.person: person,
        English.months: months,
        English.loading: loading,
        English.appName: appName,
        English.persons: persons,
        English.expanses: expanses,
        English.statistics: statistics,
        English.addExpanse: addExpanse,
        English.description: description,
        English.spendingSides: spendingSides,
        English.databaseIsClosed: databaseIsClosed,
        English.tableDoesNotExist: tableDoesNotExist,
        English.unknownDatabaseError: unknownDatabaseError,
        English.syntaxErrorInSQLQuery: syntaxErrorInSQLQuery,
        English.failedToOpenTheDatabase: failedToOpenTheDatabase,
        English.databaseIsInReadOnlyMode: databaseIsInReadOnlyMode,
        English.uniqueConstraintViolation: uniqueConstraintViolation,
      };
}
