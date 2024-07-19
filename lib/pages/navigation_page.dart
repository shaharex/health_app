// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/pages/alarm_page.dart';

import 'home_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    Key? key,
    // required this.gender,
    // required this.username,
    // required this.height,
    // required this.weight,
    // required this.birthday,
    // required this.steps,
    // required this.water,
  }) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // final String gender;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 40,
        iconTheme: const IconThemeData(color: Colors.white, size: 20),
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'MY Health Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
      body: [
        HomePage(),
        AlarmPage(),
        const Center(child: Text('Coming soon')),
        const Center(child: Text('Coming soon')),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        // хорошая штука для контроля текста в NavigationBar, можно убрать текст если он тебе не нужен
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.grey.shade900,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: 'Home'),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.alarm,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.alarm,
                color: Colors.grey,
              ),
              label: 'Alarm'),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.sports_gymnastics,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.sports_gymnastics,
                color: Colors.grey,
              ),
              label: 'Workout'),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
