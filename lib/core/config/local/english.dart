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

  static String add = "Add";
  static String data = "Data";
  static String money = "Money";
  static String search = "search";
  static String months = "Months";
  static String person = "Person";
  static String persons = "Persons";
  static String loading = "Loading";
  static String expanses = "Expanses";
  static String addPerson = "Add Person";
  static String statistics = "Statistics";
  static String appName = "Money Tracker";
  static String addExpanse = "Add Expanse";
  static String description = "Description";
  static String spendingSides = "Spending Sides";
  static String addSpendingSide = "Add Spending Side";
  static String thereIsNoData = "There Is No Data";

  static String databaseIsClosed = "Database is closed.";
  static String tableDoesNotExist = "Table does not exist.";
  static String unknownDatabaseError = "Unknown database error:";
  static String syntaxErrorInSQLQuery = "Syntax error in SQL query.";
  static String failedToOpenTheDatabase = "Failed to open the database.";
  static String uniqueConstraintViolation = "Unique constraint violation.";
  static String databaseIsInReadOnlyMode = "Database is in read-only mode.";

  static List<String> monthsList = [
    English.january,
    English.february,
    English.mars,
    English.april,
    English.may,
    English.june,
    English.july,
    English.august,
    English.september,
    English.october,
    English.november,
    English.december
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
        add: add,
        data: data,
        money: money,
        search: search,
        person: person,
        months: months,
        loading: loading,
        appName: appName,
        persons: persons,
        expanses: expanses,
        addPerson: addPerson,
        addExpanse: addExpanse,
        statistics: statistics,
        description: description,
        thereIsNoData: thereIsNoData,
        spendingSides: spendingSides,
        addSpendingSide: addSpendingSide,
        databaseIsClosed: databaseIsClosed,
        tableDoesNotExist: tableDoesNotExist,
        unknownDatabaseError: unknownDatabaseError,
        syntaxErrorInSQLQuery: syntaxErrorInSQLQuery,
        failedToOpenTheDatabase: failedToOpenTheDatabase,
        databaseIsInReadOnlyMode: databaseIsInReadOnlyMode,
        uniqueConstraintViolation: uniqueConstraintViolation,
      };
}
