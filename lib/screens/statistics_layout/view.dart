import 'package:flutter/material.dart';
import 'package:money_tracker/core/components/bottom_navigation_bar.dart';

class StatisticsLayoutScreen extends StatelessWidget {
  const StatisticsLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [],
      ),
      bottomNavigationBar: AppBottomNav(
        index: 0,
        onTap: (index) {},
      ),
    );
  }
}
