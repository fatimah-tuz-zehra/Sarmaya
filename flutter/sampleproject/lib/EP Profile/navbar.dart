import 'package:flutter/material.dart';
import '../Setting Screen/profile.dart';
import '../Setting Screen/settings.dart';
import 'ep.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
   int _selectedIndex=0;
  List<Widget>_widgetOptions=<Widget>[
    EnterpreneuerProfile(),
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