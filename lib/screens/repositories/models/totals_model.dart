import 'package:money_tracker/core/utils/constants/constants.dart';

class TotalModel {
  final String id;
  final int total;
  final String idName;

  TotalModel({
    required this.id,
    required this.total,
    required this.idName,
  });

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
