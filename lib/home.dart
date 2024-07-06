import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/controllers/dashboard_controller.dart';
import 'presentation/screens/home.dart';
import 'presentation/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final data = ref.watch(dashboardProvider.notifier);
        return Scaffold(
          body: _pages[ref.watch(dashboardProvider).selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: ref.watch(dashboardProvider).selectedIndex,
            selectedItemColor: Colors.deepPurple,
            onTap: data.setActiveTab,
          ),
        );
      },
    );
  }
}
