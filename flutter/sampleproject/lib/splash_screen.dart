import 'dart:async';

// import 'package:app/Login_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/Admin/Adminnavbar.dart';
import 'package:sampleproject/Investor%20Profile/investor_login.dart';

import 'Authentication/LogIn.dart';
import 'Investor Profile/investorLotto.dart';
import 'LuckyDraw/SpinWheelScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Initstate();
}

class Initstate extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, navigatetohome);
  }

  loginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), (() {}));
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user?.uid)
        .get()
        .then((DocumentSnapshot documentsnapshot) {
      if (documentsnapshot.exists) {
        if (documentsnapshot.get('role') == 'Investor') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const InvestorSpinWheel(),
            ),
          );
        } else if (documentsnapshot.get('role') == 'Admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminNavbar(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SpinWheel(),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: new Color(0xffF5591F),
                gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)), (new Color(0xffF2861E))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          ),
          Center(
            child: Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/sarmayalogo.png")),
          )
        ],
      ),
    );
  }
}
