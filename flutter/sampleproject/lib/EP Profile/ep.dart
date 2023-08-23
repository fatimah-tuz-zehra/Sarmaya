import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:sampleproject/EP%20Profile/Add%20Post/proposal_navbar.dart';
import 'package:sampleproject/EP%20Profile/chat.dart';
import 'package:sampleproject/LuckyDraw/lotto.dart';

class EnterpreneuerProfile extends StatefulWidget {
  const EnterpreneuerProfile({Key? key}) : super(key: key);

  @override
  State<EnterpreneuerProfile> createState() => _EnterpreneuerProfileState();
}

class _EnterpreneuerProfileState extends State<EnterpreneuerProfile> {
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
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "Daily Bonds",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
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
                                  title: "Add Proposal",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ProposalNavbar()),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Category(
                                  imagePath: "assets/lottery.png",
                                  title: "LOTTO",
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => lotto()),
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
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => ChatScreen()),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Category(
                                  imagePath: "assets/history.png",
                                  title: "History",
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

  const Category({Key? key, required this.imagePath, required this.title, this.onTap}) : super(key: key);

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
