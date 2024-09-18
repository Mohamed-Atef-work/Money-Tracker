import 'package:money_tracker/core/utils/constants/constants.dart';

class TotalModel {
  final String id;
  final int total;
  final String idName;

  late final String month;
  late final String person;
  late final String spendingSide;

  TotalModel({
    required this.id,
    required this.total,
    required this.idName,
  }) {
    final List<String> parts = id.split("0");
    if (parts.length == 3) {
      month = parts[0];
      person = parts[1];
      spendingSide = parts[2];
    }
  }

  factory TotalModel.fromJson(Map<String, dynamic> json) => TotalModel(
        id: json[kId],
        idName: json[kIdName],
        total: int.parse(json[kTotal]),
      );

  factory TotalModel.fromNoJson(String idName, String id) => TotalModel(
        id: id,
        total: 0,
        idName: idName,
      );

  Map<String, dynamic> toJson(int expanseMoney) => {
        kId: id,
        kIdName: idName,
        kTotal: (total + expanseMoney).toString(),
      };

  @override
  String toString() => '''
    $kId --------> $id
    $kTotal -----> $total
    $kIdName ----> $idName
    ''';
}
