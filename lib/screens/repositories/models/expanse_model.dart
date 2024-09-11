import 'package:money_tracker/core/utils/constants/constants.dart';

class ExpanseModel {
  final int? id;
  final int money;
  final String month;
  final String person;
  final String description;
  final String spendingSide;

  ExpanseModel({
    this.id,
    required this.month,
    required this.money,
    required this.person,
    required this.description,
    required this.spendingSide,
  });

  factory ExpanseModel.fromJson(Map<String, dynamic> json) => ExpanseModel(
        id: json[kId],
        month: json[kMonth],
        money: json[kMoney],
        person: json[kPerson],
        description: json[kDescription],
        spendingSide: json[kSpendingSide],
      );

  toJson() => {
        kMonth: month,
        kMoney: money,
        kPerson: person,
        kDescription: description,
        kSpendingSide: spendingSide,
      };
}
