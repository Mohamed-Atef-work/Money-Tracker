import 'package:get/get.dart';
import 'package:money_tracker/core/utils/local/arabic.dart';
import 'package:money_tracker/core/utils/local/english.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<English>(() => English());
    Get.lazyPut<Arabic>(() => Arabic());
  }
}
