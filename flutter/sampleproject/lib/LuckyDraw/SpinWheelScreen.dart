import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../EP Profile/Navbar.dart';
class SpinWheel extends StatefulWidget {
  const SpinWheel({super.key});

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final selected =BehaviorSubject<int>();
  List<int> items = [
    0,2,5,0,10,
  ];
  int rewards=0;
  @override
  void dispose() {
    selected.close();
    super.dispose();
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
              ),), ),
          title: Text("Daily Rewards"),
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.cancel,
              color: Colors.white,
            ),
            onPressed: ()
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navbar()));
            },)),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              SizedBox(
                height: 300,
                child: FortuneWheel(
                  selected: selected.stream,
                  animateFirst: false,
                  items:[
                    for (int i =0; i< items.length; i++)...<FortuneItem>{
                      FortuneItem(child: Text(items[i].toString())),
                    }
                  ],
                  onAnimationEnd: (){
                    setState(() {
                      rewards = items[selected.value];
                    });
                    // Store data in Firebase
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    final collectionRef = FirebaseFirestore.instance.collection('EnterpreneurReward');

                    collectionRef.add({
                      'uid': uid,
                      'rewards': rewards,
                      'timestamp': DateTime.now(),
                    }).then((value) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("You Win Rs $rewards"),
                          );
                        },
                      );
                    }).catchError((error) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Error storing data: $error"),
                          );
                        },
                      );
                    });
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       content: Text("You Win Rs  " +rewards.toString()),
                    //
                    //     );
                    //   },
                    // );
                  },
                )
                ,
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      selected.add(Fortune.randomInt(0, items.length));
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text("SPIN"),
                    ),
                  ))
            ],

          )),
    );
  }
}
