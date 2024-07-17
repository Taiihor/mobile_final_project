
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens_of_main_pages/developer_screen.dart';
import '../screens_of_main_pages/home_page.dart';
import '../screens_of_main_pages/profile_screen.dart';
import '../screens_of_main_pages/search_screen.dart';

class MainScreenPage extends StatefulWidget {
   MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  int _selectedIndex =0;
  final screens = [
    HomePage(),
    SearchScreen(),
    DeveloperScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );

  }
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, color: Colors.black), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search, color: Colors.black), label: 'Search'),
          //BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled, color: Colors.black), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_3_fill, color: Colors.black), label: 'Videos'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled, color: Colors.black), label: 'Profile'),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      currentIndex: _selectedIndex,
    );
  }
}
