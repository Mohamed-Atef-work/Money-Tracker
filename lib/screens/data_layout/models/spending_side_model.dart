import 'package:money_tracker/core/utils/constants/constants.dart';

class SpendingSideModel {
  final int id;
  final String spendingSide;

  SpendingSideModel({required this.id, required this.spendingSide});

  factory SpendingSideModel.fromJson(Map<String, dynamic> json) =>
      SpendingSideModel(
        id: json[kId],
        spendingSide: json[kSpendingSide],
      );

  toJson() => {kSpendingSide: spendingSide};
}
