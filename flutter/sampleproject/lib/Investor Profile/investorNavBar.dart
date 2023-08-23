import 'package:flutter/material.dart';
import 'package:sampleproject/Investor%20Profile/investor_login.dart';
import '../../Setting Screen/profile.dart';
import '../../Setting Screen/settings.dart';
class investorNavbar extends StatefulWidget {
  const investorNavbar({super.key});

  @override
  State<investorNavbar> createState() => _investorNavbarState();
}

class _investorNavbarState extends State<investorNavbar> {
  int _selectedIndex=0;
  List<Widget>_widgetOptions=<Widget>[
    investor_login(),
    ProfilePage(),
    SettingScreen()

  ];
  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.deepOrange),label: "Home"  ),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.deepOrange,), label: "Profile",),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.deepOrange), label: "Settings", backgroundColor:Colors.black)
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,

      ),


    );
  }
}