import 'package:money_tracker/core/utils/constants/constants.dart';

class PersonModel {
  final int id;
  final String person;

  PersonModel({required this.id, required this.person});

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        id: json[kId],
        person: json[kPerson],
      );

  toJson() => {kPerson: person};
}
