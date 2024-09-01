import 'package:get/get.dart';
import 'package:money_tracker/screens/data_layout/views/add_expanse_screen.dart';
import 'package:money_tracker/screens/data_layout/views/layout_screen.dart';
import 'package:money_tracker/core/utils/screens_strings.dart';
import 'package:money_tracker/screens/home_panel_screen/view.dart';
import 'package:money_tracker/screens/statistics_layout/view.dart';
import 'package:money_tracker/test_screen.dart';

List<GetPage<dynamic>>? pages() => [
      GetPage(
        name: Screens.test,
        page: () => const TestScreen(),
      ),
      GetPage(
        name: Screens.homePanel,
        page: () => const HomePanelScreen(),
      ),
      GetPage(
        name: Screens.dataLayout,
        page: () => const DataLayoutScreen(),
      ),
      GetPage(
        name: Screens.statisticsLayout,
        page: () => const StatisticsLayoutScreen(),
      ),
      GetPage(
        name: Screens.addExpanse,
        page: () => const AddExpanseScreen(),
      ),
    ];
