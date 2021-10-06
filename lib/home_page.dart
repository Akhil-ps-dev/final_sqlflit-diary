//@dart=2.9

import 'package:devolopment/screens/initial_pages/01_note_list.dart';
import 'package:devolopment/screens/initial_pages/02_Calendar_page.dart';
import 'package:devolopment/screens/initial_pages/05_settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    NoteList(),
    CalendarPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey[700],
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today_outlined,
              ),
              label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
