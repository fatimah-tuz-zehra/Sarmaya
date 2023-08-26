import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Authentication/LogIn.dart';
import '../Authentication/change_pass.dart';
import '../Setting Screen/Terms&Conditions.dart';
class AdminSetting extends StatefulWidget {
  const AdminSetting({Key? key}) : super(key: key);

  @override
  State<AdminSetting> createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSetting> {
  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUser = user;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black45, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text("Settings"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        elevation: 1,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(height: 15),
            userTile(),
            divider(),
            colorTiles(),
            // bwTiles(),
          ],
        ),
      ),
    );
  }
  Widget userTile(){
    return ListTile(
      title: _currentUser != null
          ? Text(
        _currentUser!.displayName ?? "",
        style: TextStyle(
          fontSize: 29, // Adjust the font size as needed
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      )
          : Text(
        "Loading...",
        style: TextStyle(
          fontSize: 29, // Adjust the font size as needed
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
    );
  }
  Widget divider(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
  Widget colorTiles(){
    return Column(
      children: [
        // colorTile(Icons.person_outline, Colors.deepPurple,"My Profile", NotificationScreen()),
        colorTile(Icons.privacy_tip, Colors.blue,"Change Password",changepassword()),
        colorTile(Icons.bookmark, Colors.brown,"Terms & Conditions", TandC()),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text('Sign Out'),
          ),
        ),
      ],


    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  Widget colorTile(IconData icon,Color color, String text, Widget route){
    return ListTile(
      leading: Container(
        child: Icon(icon,color: color),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: color.withOpacity(0.10),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20),
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => route),
        );
      },
    );
  }
}
