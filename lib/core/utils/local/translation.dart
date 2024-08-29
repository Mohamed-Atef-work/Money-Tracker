import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/arabic.dart';
import 'package:money_tracker/core/utils/local/english.dart';
import 'package:money_tracker/core/utils/local/local_constants.dart';

class AppLocalization extends Translations {
  final arabic = Arabic();
  final english = English();

  @override
  Map<String, Map<String, String>> get keys => {
        kArabicCode: arabic.toMap(),
        kEnglishCode: english.toMap(),
      };
}
