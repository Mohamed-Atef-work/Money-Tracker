import 'package:money_tracker/core/config/local/english.dart';

class Arabic {
  static String code = "ar";

  static String of = "ل";
  static String inProposition = "في";

  static String error = "حدث خطأ...";
  static String search = "ابحث";
  static String data = "بيانات";
  static String months = "شهور";
  static String money = "المال";
  static String person = "الشخص";
  static String persons = "اشخاص";
  static String invalid = "غير صالح ";
  static String expanses = "مصروفات";
  static String description = "الوصف";
  static String loading = "جار التحمبل";
  static String statistics = "احصائيات";
  static String appName = "متتبع المال";
  static String addExpanse = "اضافة مصروف";
  static String spendingSide = "وجه الانفاق";
  static String spendingSides = "أوجه الانفاق";
  static String thereIsNoData = "لا يوجد بيانات";

  static String add = "اضافة";
  static String month = "الشهر";
  static String total = "المجموع";
  static String addPerson = "اضافة شخص";
  static String addSpendingSide = "اضافة جهة انفاق";

  static String may = "مايو";
  static String mars = "مارس";
  static String june = "يونيو";
  static String july = "يوليو";
  static String april = "أبريل";
  static String august = "أغسطس";
  static String january = "يناير";
  static String october = "أكتوبر";
  static String november = "نوفمبر";
  static String december = "ديسمبر";
  static String february = "فبراير";
  static String september = "سبتمبر";

  static String eachPersonTotal = "مجموع كل شخص ";
  static String eachSpendingSideTotal = "مجموع كل وجه إنفاق ";

  static String databaseIsClosed = "Database is closed.";
  static String tableDoesNotExist = "Table does not exist.";
  static String unknownDatabaseError = "Unknown database error:";
  static String syntaxErrorInSQLQuery = "Syntax error in SQL query.";
  static String failedToOpenTheDatabase = "Failed to open the database.";
  static String uniqueConstraintViolation = "Unique constraint violation.";
  static String databaseIsInReadOnlyMode = "Database is in read-only mode.";

  static Map<String, String> toMap() => {
        English.inProposition: inProposition,
        English.of: of,
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
        English.add: add,
        English.data: data,
        English.total: total,
        English.month: month,
        English.money: money,
        English.search: search,
        English.person: person,
        English.months: months,
        English.invalid: invalid,
        English.loading: loading,
        English.appName: appName,
        English.persons: persons,
        English.expanses: expanses,
        English.addPerson: addPerson,
        English.statistics: statistics,
        English.addExpanse: addExpanse,
        English.description: description,
        English.spendingSide: spendingSide,
        English.spendingSides: spendingSides,
        English.thereIsNoData: thereIsNoData,
        English.eachPersonTotal: eachPersonTotal,
        English.addSpendingSide: addSpendingSide,
        English.databaseIsClosed: databaseIsClosed,
        English.tableDoesNotExist: tableDoesNotExist,
        English.unknownDatabaseError: unknownDatabaseError,
        English.eachSpendingSideTotal: eachSpendingSideTotal,
        English.syntaxErrorInSQLQuery: syntaxErrorInSQLQuery,
        English.failedToOpenTheDatabase: failedToOpenTheDatabase,
        English.databaseIsInReadOnlyMode: databaseIsInReadOnlyMode,
        English.uniqueConstraintViolation: uniqueConstraintViolation,
      };
}
