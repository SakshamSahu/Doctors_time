import 'package:doctors_time/pages/patient/appointment_page.dart';
import 'package:doctors_time/pages/patient/chat_page.dart';
import 'package:doctors_time/pages/patient/home_page.dart';
import 'package:doctors_time/pages/patient/important_updates.dart';
import 'package:doctors_time/pages/patient/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
  static const String routeName = "bottom-nav-bar";
}

class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  final List _pages = [
    const HomePage(),
    const AppointmentPage(),
    const ChatPage(),
    const ImportantUpdates(),
    const ProfilePage(),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedIconTheme:
            const IconThemeData(color: Color(0XFF0217A8), size: 35),
        selectedItemColor: const Color(0XFF0217A8),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.today,
              ),
              label: "Appointments"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_text,
              ),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.emergency_share,
              ),
              label: "Important"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_solid,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
