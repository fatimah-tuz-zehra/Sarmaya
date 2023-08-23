import 'package:flutter/material.dart';
import 'package:sampleproject/Setting%20Screen/settings.dart';
class profileUpdate extends StatelessWidget {

  const profileUpdate({Key? key, required Map<String, String> user_profile}) : super(key: key);


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
        title: Text("Your Profile"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          },
        ),
      ),


    );
  }
}
