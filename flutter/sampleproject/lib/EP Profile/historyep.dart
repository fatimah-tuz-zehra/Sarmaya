import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../EP Profile/Navbar.dart';

class ephistory extends StatefulWidget {
  const ephistory({Key? key}) : super(key: key);

  @override
  State<ephistory> createState() => _ephistoryState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;

class _ephistoryState extends State<ephistory> {
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
          title: Text("History"),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('history')
                      // .doc(uid).
                      .where('likedby', isEqualTo: uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      // Handle the error
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                            var data = snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                            DateTime dateTime = data['timestamp']
                                .toDate(); // Convert Timestamp to DateTime

                            String formattedDate =
                                DateFormat.yMMMMd().format(dateTime);
                            return Card(
                              elevation: 5,
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.white60,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 25, right: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Liked",
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
                                            "Title",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                          Spacer(),
                                          Text(
                                            "Posted by",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${data['title']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          Spacer(),
                                          Text(
                                            "${data['postedby']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            "Message",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${data['msg']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      // Container(
                                      //     height: 40,
                                      //     width: 300,
                                      //     child: Image.asset("images/qr.jpg")),
                                      Center(
                                          child: Text(
                                        "Date: $formattedDate",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }));
                    }
                  },
                ),
              ),
              // Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     Card(
              //       elevation: 5,
              //       child: Container(
              //         height: 200,
              //         width: 400,
              //         color: Colors.white60,
              //         child: Padding(
              //           padding:
              //               const EdgeInsets.only(top: 8, left: 25, right: 25),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Center(
              //                 child: Text(
              //                   "Sarmaya",
              //                   style: TextStyle(
              //                       fontSize: 20,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.black),
              //                 ),
              //               ),
              //               SizedBox(
              //                 height: 10,
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     "User of post",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.grey),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     "Date",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.grey),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     "50 Rs",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.black),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     "10/04/2023",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.black),
              //                   ),
              //                 ],
              //               ),
              //               Divider(),
              //               Row(
              //                 children: [
              //                   Text(
              //                     "Prize Amount",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.grey),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     "last Date",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.grey),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   Text(
              //                     "10000 Rs",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.black),
              //                   ),
              //                   Spacer(),
              //                   Text(
              //                     "17/05/2023",
              //                     style: TextStyle(
              //                         fontSize: 16, color: Colors.black),
              //                   ),
              //                 ],
              //               ),
              //               // Container(
              //               //     height: 40,
              //               //     width: 300,
              //               //     child: Image.asset("images/qr.jpg")),
              //               Center(
              //                   child: Text(
              //                 "Ticket No: 353500",
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black),
              //               ))
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //         left: -5,
              //         child: Container(
              //           height: 20,
              //           width: 20,
              //           decoration: const BoxDecoration(
              //               color: Color(0xffF5591F), shape: BoxShape.circle),
              //         )),
              //     Positioned(
              //         right: -5,
              //         child: Container(
              //           height: 20,
              //           width: 20,
              //           decoration: const BoxDecoration(
              //               color: Color(0xffF5591F), shape: BoxShape.circle),
              //         )),
              //     SizedBox(
              //       height: 20,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         showDialogForAppllied();
              //       },
              //       child: Container(
              //         height: 40,
              //         width: 100,
              //         color: Colors.deepOrange,
              //         child: Center(
              //           child: Text(
              //             "Buy Tickets",
              //             style: TextStyle(
              //                 color: Colors.white, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
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
}
