import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/bottom_nav.dart';
import 'home/home_tab.dart';
import 'home/search_screen.dart';
import 'home/bookings_screen.dart';
import 'home/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavViewModel>(
      builder: (context, vm, child) {
        final pages = const [
          HomeTab(),
          SearchTab(),
          BookingsTab(),
          ProfileTab(),
        ];

        return Scaffold(
          body: pages[vm.currentIndex],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: vm.currentIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              enableFeedback: false,
              onTap: vm.changeIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.car_rental_rounded),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
