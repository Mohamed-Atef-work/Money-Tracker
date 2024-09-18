import 'package:flutter/material.dart';

const kHorizontal10Vertical5 =
    EdgeInsets.symmetric(horizontal: 10, vertical: 5);
const kHorizontalPadding5 = EdgeInsets.symmetric(horizontal: 5);
const kHorizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
const kHorizontalPadding10 = EdgeInsets.symmetric(horizontal: 10);
const kDuration1Second = Duration(seconds: 1);
const kPrimaryColorYellow = Color(0xFFffbd29);
const kWhiteGray = Color(0xFFffe3ac);
const kDarkBrown = Color(0xFF785326);
const kWhite = Colors.white;
const kBlack = Colors.black;

const String kId = "Id";
const String kMoney = "Money";
const String kMonth = "Month";
const String kTotal = "Total";
const String kIdName = "IdName";
const String kMonths = "Months";
const String kPerson = "Person";
const String kTotals = "Totals";
const String kPersons = "Persons";
const String kMonthSide = "MonthSide";
const String kMonthPerson = "MonthPerson";
const String kDescription = "Description";
const String kSpendingSide = "SpendingSide";
const String kSpendingSides = "SpendingSides";
const String kMonthPersonSide = "MonthPersonSide";

String monthSide(String month, String side) => "${month}0P0$side";
String monthPerson(String month, String person) => "${month}0${person}0S";
String monthPersonSide(String month, String person, String side) =>
    "${month}0${person}0$side";

const String kMay = "May";
const String kJune = "June";
const String kJuly = "July";
const String kMars = "Mars";
const String kApril = "April";
const String kAugust = "August";
const String kOctober = "October";
const String kJanuary = "January";
const String kNovember = "November";
const String kDecember = "December";
const String kFebruary = "February";
const String kSeptember = "September";
