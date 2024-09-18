import 'package:money_tracker/core/utils/constants/constants.dart';

const kAnd = "And";
const kKey = "KEY";
const kText = "TEXT";
const kPrimary = "PRIMARY";
const kInteger = "INTEGER";
const kdbPath = 'money_tracker.db';
const kCreateTable = "CREATE TABLE";

const String kPersonsTable = '''$kCreateTable $kPersons
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText
      )''';
const String kTotalsTable = '''$kCreateTable $kTotals
      (
      $kId $kText $kPrimary $kKey,
      $kIdName $kText,
      $kTotal $kText
      )''';
const String kSpendingSidesTable = '''$kCreateTable $kSpendingSides
      (
      $kId $kInteger $kPrimary $kKey,
      $kSpendingSide $kText
      )''';
String kMonthTable(String month) => '''$kCreateTable $month
      (
      $kId $kInteger $kPrimary $kKey,
      $kPerson $kText,
      $kMonth $kText,
      $kMoney $kInteger,
      $kDescription $kText,
      $kSpendingSide $kText
      )''';
