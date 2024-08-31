import 'package:flutter/material.dart';

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
      backgroundColor: Colors.green,
      currentIndex: index,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          label: '',
          activeIcon: Icon(Icons.person, color: Colors.white),
          icon: Icon(Icons.person, color: Colors.black),
        ),
        BottomNavigationBarItem(
          label: '',
          activeIcon: Icon(Icons.monetization_on, color: Colors.white),
          icon: Icon(Icons.monetization_on, color: Colors.black),
        ),
        BottomNavigationBarItem(
          label: '',
          activeIcon: Icon(Icons.calendar_month, color: Colors.white),
          icon: Icon(Icons.calendar_month, color: Colors.black),
        ),
      ],
    );
  }
}
