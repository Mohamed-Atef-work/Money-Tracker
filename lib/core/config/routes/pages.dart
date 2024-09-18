import 'package:money_tracker/core/config/routes/routes_strings.dart';
import 'package:money_tracker/screens/add_expanse_screen/view.dart';
import 'package:money_tracker/screens/layout/view.dart';
import 'package:money_tracker/test_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? pages() => [
      GetPage(
        name: Routes.test,
        page: () => const TestScreen(),
      ),
      GetPage(
        name: Routes.layout,
        page: () => const LayoutScreen(),
      ),
      GetPage(
        name: Routes.addExpanse,
        page: () => const AddExpanseScreen(),
      ),
    ];
