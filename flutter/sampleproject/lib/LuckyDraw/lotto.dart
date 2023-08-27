import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../EP Profile/Navbar.dart';

class lotto extends StatefulWidget {
  const lotto({Key? key}) : super(key: key);

  @override
  State<lotto> createState() => _lottoState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;
var documentId;

class _lottoState extends State<lotto> {
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
        title: Text("Lotto Tickets"),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Lotto')
              .where('Sold', isEqualTo: 'no')
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
                  DateTime dateTime = data['Timestamp']
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
                                  "${data['Prize']} Rs",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Spacer(),
                              ],
                            ),
                            Row(children: [
                              Text(
                                "Ticket No: ${data['Ticket']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    getDocumentIdByFieldValue(data);
                                    checkamount(data, data['amount']);
                                    // upload(data);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    color: Colors.deepOrange,
                                    child: Center(
                                        child: Text(
                                      "Buy Tickets",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ))
                            ]),
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

  showDialogForAppllied() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 290,
            child: Column(
              children: [
                Image.asset("assets/cng1.png"),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "your application is submitted",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    child: const Text(
                      "Thankyou for choosing us, in 10 days you will recive a"
                      " confirmation of your request. Remember to be attentive to your email"
                      " where you will recive all information.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> getDocumentIdByFieldValue(final dataaa) async {
    try {
      final collectionReference =
          FirebaseFirestore.instance.collection('Lotto');
      final querySnapshot = await collectionReference
          .where('Ticket', isEqualTo: dataaa['Ticket'])
          .get();

      if (querySnapshot.size > 0) {
        final documentSnapshot = querySnapshot.docs.first;
        setState(() {
          documentId = documentSnapshot.id;
        });
        // documentId = documentSnapshot.id;

        print('Document ID: $documentId');
      } else {
        print('No matching documents found.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
        ),
      );
      print('Error: ${e.toString()}');
    }
  }

  Future checkamount(final dataa, int bondamount) async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(uid) // Replace with the actual user ID
        .get();
    int walletBalance = userSnapshot['rewards'] as int;
    int bondcost = bondamount;
    if (walletBalance >= bondcost) {
      int newBalance = walletBalance - bondcost;
      showDialogForAppllied();
      upload(dataa, newBalance);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Insufficient  Balance'),
        ),
      );
    }
  }

  Future upload(final dataa, int newBalance) async {
    try {
      final docuser = FirebaseFirestore.instance.collection('Purchased Lotto');
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uid) // Replace with the actual user ID
          .update({'rewards': newBalance});
      final data1 = {
        'amount': dataa['amount'],
        'ticketnumber': dataa['Ticket'],
        'uid': uid,
        'prize': dataa['Prize'],
        'purchaseddate': Timestamp.now(),
      };
      await docuser.add(data1);

      final updateticket =
          FirebaseFirestore.instance.collection('Lotto').doc(documentId);
      await updateticket.update({'Sold': 'yes'});
      // Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Tickets Purchased!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
