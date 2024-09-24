import 'package:get/get.dart';
import 'package:money_tracker/core/config/local/english.dart';

class Validators {
  static String? stringValidator(value, String message) {
    // Regular expression pattern to match valid names (letters, spaces, hyphens, and apostrophes)
    const pattern = r"^[a-zA-Z\s\-\'\’]+$";
    final regExp = RegExp(pattern);

    if (value.isEmpty || !regExp.hasMatch(value)) {
      return "${message.tr} ${English.invalid.tr}"; // Name is empty or null
    }

    return null;
  }

  static String? numericValidator(value, String message) {
    if (value.isEmpty || double.tryParse(value) == null) {
      return "${message.tr} ${English.invalid.tr}";
    }
    return null;
  }
}
