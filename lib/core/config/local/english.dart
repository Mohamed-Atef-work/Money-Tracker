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
  static String total = "Total";
  static String month = "Month";
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
  static String spendingSide = "Spending Side";
  static String thereIsNoData = "There Is No Data";
  static String addSpendingSide = "Add Spending Side";

  static String eachSpendingSideTotalOfThisMonth =
      "Each Spending Side Total Of This Month";
  static String eachSpendingSideTotalOfThisPersonInThisMonth =
      "Each Spending Side Total Of This Person In This Month";
  static String eachPersonTotalOfThisSpendingSideInThisMonth =
      "Each Person Total Of This Spending Side In This Month";
  static String eachPersonTotalOfThisMonth = "Each Person Total Of This Month";

  static String databaseIsClosed = "Database is closed.";
  static String tableDoesNotExist = "Table does not exist.";
  static String unknownDatabaseError = "Unknown database error:";
  static String syntaxErrorInSQLQuery = "Syntax error in SQL query.";
  static String failedToOpenTheDatabase = "Failed to open the database.";
  static String uniqueConstraintViolation = "Unique constraint violation.";
  static String databaseIsInReadOnlyMode = "Database is in read-only mode.";

  static List<String> monthsList = [
    january,
    february,
    mars,
    april,
    may,
    june,
    july,
    august,
    september,
    october,
    november,
    december
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
        total: total,
        month: month,
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
        spendingSide: spendingSide,
        addSpendingSide: addSpendingSide,
        databaseIsClosed: databaseIsClosed,
        tableDoesNotExist: tableDoesNotExist,
        unknownDatabaseError: unknownDatabaseError,
        syntaxErrorInSQLQuery: syntaxErrorInSQLQuery,
        failedToOpenTheDatabase: failedToOpenTheDatabase,
        databaseIsInReadOnlyMode: databaseIsInReadOnlyMode,
        uniqueConstraintViolation: uniqueConstraintViolation,
        eachPersonTotalOfThisSpendingSideInThisMonth:
            eachPersonTotalOfThisSpendingSideInThisMonth,
        eachPersonTotalOfThisMonth: eachPersonTotalOfThisMonth,
        eachSpendingSideTotalOfThisPersonInThisMonth:
            eachSpendingSideTotalOfThisPersonInThisMonth,
        eachSpendingSideTotalOfThisMonth: eachSpendingSideTotalOfThisMonth,
      };
}
