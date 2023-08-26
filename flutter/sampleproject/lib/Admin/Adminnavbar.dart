import 'package:flutter/material.dart';
import 'package:sampleproject/Admin/Adminsettings.dart';
import 'package:sampleproject/Admin/admin.dart';
import 'package:sampleproject/Admin/adminfeedback.dart';

import '../Setting Screen/profile.dart';
import '../Setting Screen/settings.dart';

class AdminNavbar extends StatefulWidget {
  const AdminNavbar({super.key});

  @override
  State<AdminNavbar> createState() => _AdminNavbarState();
}

class _AdminNavbarState extends State<AdminNavbar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    admin(),
    AdminFeedbackScreen(),
    AdminSetting()
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.deepOrange), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.feedback,
              color: Colors.deepOrange,
            ),
            label: "Feedback",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.deepOrange),
              label: "Settings",
              backgroundColor: Colors.black)
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
