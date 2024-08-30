import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/arabic.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        Arabic.code: Arabic.toMap(),
        English.code: English.toMap(),
      };
}
