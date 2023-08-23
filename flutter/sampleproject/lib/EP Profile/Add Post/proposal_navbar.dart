import 'package:flutter/material.dart';
import 'package:sampleproject/EP%20Profile/Add%20Post/Add_Post.dart';
import 'package:sampleproject/EP%20Profile/Add%20Post/View_Post.dart';

class ProposalNavbar extends StatefulWidget {
  const ProposalNavbar({Key? key}) : super(key: key);

  @override
  State<ProposalNavbar> createState() => _ProposalNavbarState();
}
class _ProposalNavbarState extends State<ProposalNavbar> {
  int _selectedIndex=1;
  List<Widget>_widgetOptions=<Widget>[
PostingData(),
PushNotificationScreen(),



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
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, color: Colors.deepOrange,), label: "Add Post",),
          // BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.deepOrange,), label: "Search",),
          // BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.deepOrange), label: "Favorite",)
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,

      ),

    );
  }
}
