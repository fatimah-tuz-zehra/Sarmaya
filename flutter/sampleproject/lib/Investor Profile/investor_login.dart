import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sampleproject/EP%20Profile/Add%20Post/View_Post.dart';
import 'package:sampleproject/Investor%20Profile/InvestorViewPost.dart';
import 'package:sampleproject/Investor%20Profile/history.dart';
import '../EP Profile/chat.dart';
import '../EP Profile/mylotto.dart';
import '../LuckyDraw/lotto.dart';

class investor_login extends StatefulWidget {
  const investor_login({Key? key}) : super(key: key);

  @override
  State<investor_login> createState() => _investorState();
}

int currentRewards = 0;
final uid = FirebaseAuth.instance.currentUser!.uid;

class _investorState extends State<investor_login> {
  Future<void> updateRewards() async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('Users').doc(uid).get();
    setState(() {
      currentRewards = snapshot['rewards'];
    });
  }

  @override
  void initState() {
    updateRewards();
    super.initState();
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
        title: Image.asset(
          "assets/sarmayalogo.png",
          fit: BoxFit.contain,
          height: 50,
        ),
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_active_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(15),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_balance_wallet,
                              size: 40,
                              color: Colors.deepOrange,
                            ),
                            SizedBox(width: 20), // Adjust the spacing
                            Text(
                              'Wallet Amount :  $currentRewards',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Category(
                                  imagePath: "assets/addpost.png",
                                  title: "Proposals",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            InvestorViewPost(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Category(
                                  imagePath: "assets/lottery.png",
                                  title: "LOTTO",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => lotto()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Category(
                                  imagePath: "assets/chat.png",
                                  title: "Community",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ChatScreen()),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Category(
                                  imagePath: "assets/history.png",
                                  title: "History",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => history()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Category(
                                  imagePath: "assets/tickets.png",
                                  title: "My Lotto",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => mylotto()),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function()? onTap;

  const Category(
      {Key? key, required this.imagePath, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      child: Column(
        children: [
          Card(
            child: Container(
              width: 95,
              height: 129,
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
