import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../EP Profile/Navbar.dart';

class mylotto extends StatefulWidget {
  const mylotto({Key? key}) : super(key: key);

  @override
  State<mylotto> createState() => _mylottoState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;
var documentId;

class _mylottoState extends State<mylotto> {
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
        title: Text("My Tickets"),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Purchased Lotto')
              .where('uid', isEqualTo: uid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              // Handle the error
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                heightFactor: 3,
                widthFactor: 3,
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  var data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  DateTime dateTime = data['purchaseddate']
                      .toDate(); // Convert Timestamp to DateTime

                  String formattedDate = DateFormat.yMMMMd().format(dateTime);
                  //Card Starts here

                  return Card(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: 400,
                      color: Colors.white60,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Prize Bond",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Sarmaya",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Text(
                                  "Date",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${data['amount']}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                                Text(
                                  "$formattedDate",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text(
                                  "Prize Amount",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${data['prize']} Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                              ],
                            ),
                            Center(
                              child: Text(
                                "Ticket No: ${data['ticketnumber']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );

                  //Card Ends
                }),
              );
            }
          },
        ),
      ),
    );
  }
}
