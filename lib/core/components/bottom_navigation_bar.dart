import 'package:flutter/material.dart';
import 'package:money_tracker/core/utils/constants/constants.dart';

class AppBottomNav extends StatelessWidget {
  final int index;
  final void Function(int)? onTap;
  const AppBottomNav({
    super.key,
    this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.orange,
      backgroundColor: Colors.black,
      currentIndex: index,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.person, color: kDarkBrown),
          activeIcon: Icon(Icons.person, color: Colors.white),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.monetization_on, color: kDarkBrown),
          activeIcon: Icon(Icons.monetization_on, color: Colors.white),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.calendar_month, color: kDarkBrown),
          activeIcon: Icon(Icons.calendar_month, color: Colors.white),
        ),
      ],
    );
  }
}
