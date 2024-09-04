import 'package:get/get.dart';
import 'package:money_tracker/core/config/local/english.dart';
import 'package:money_tracker/core/config/local/arabic.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        Arabic.code: Arabic.toMap(),
        English.code: English.toMap(),
      };
}
