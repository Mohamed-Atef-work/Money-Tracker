import 'package:money_tracker/screens/data_layout/views/add_expanse_screen.dart';
import 'package:money_tracker/screens/data_layout/views/layout_screen.dart';
import 'package:money_tracker/core/config/routes/routes_strings.dart';
import 'package:money_tracker/screens/home_panel_screen/view.dart';
import 'package:money_tracker/screens/statistics_layout/view.dart';
import 'package:money_tracker/test_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? pages() => [
      GetPage(
        name: Routes.test,
        page: () => const TestScreen(),
      ),
      GetPage(
        name: Routes.homePanel,
        page: () => const HomePanelScreen(),
      ),
      GetPage(
        name: Routes.dataLayout,
        page: () => const DataLayoutScreen(),
      ),
      GetPage(
        name: Routes.addExpanse,
        page: () => const AddExpanseScreen(),
      ),
      GetPage(
        name: Routes.statisticsLayout,
        page: () => const StatisticsLayoutScreen(),
      ),
    ];
