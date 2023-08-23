// import 'dart:js';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/Setting%20Screen/rating.dart';
import '../Authentication/LogIn.dart';
import '../Authentication/change_pass.dart';
import '../EP Profile/Navbar.dart';
import 'Terms&Conditions.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {

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
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250"),
      ),
      title: _currentUser != null ? Text(_currentUser!.displayName ?? "") : Text("Loading..."),
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
        colorTile(Icons.feedback_outlined, Colors.pink,"Feedback",RatingScreen()),
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




