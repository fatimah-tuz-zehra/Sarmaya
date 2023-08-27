import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../EP Profile/Navbar.dart';

class openedlotto extends StatefulWidget {
  const openedlotto({Key? key}) : super(key: key);

  @override
  State<openedlotto> createState() => _openedlottoState();
}

final uid = FirebaseAuth.instance.currentUser!.uid;
var documentId;

class _openedlottoState extends State<openedlotto> {
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
        title: Text("Opened Lotto"),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Opened Lotto')
              // .orderBy('Draw',
              //     descending: true) // Order by 'Draw' field in descending order
              // .limit(1)
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
              List<Map<String, dynamic>> dataList =
                  snapshot.data!.docs.map((doc) {
                return doc.data() as Map<String, dynamic>;
              }).toList();

              return DataTable(
                columns: [
                  DataColumn(label: Text('Draw')),
                  DataColumn(label: Text('Bonds')),
                  // DataColumn(label: Text('Range2')),
                  // DataColumn(label: Text('Prize')),
                ],
                rows: dataList.map((data) {
                  String draw = data['Draw Number'].toString();
                  // String prize = data['Prize'].toString();

                  List<String> bonds = [];
                  int bondIndex = 1;
                  while (data.containsKey('Bond$bondIndex')) {
                    bonds.add(data['Bond$bondIndex'].toString());
                    bondIndex++;
                  }
                  String bondsDisplay = bonds.join(', ');

                  return DataRow(cells: [
                    DataCell(Text(draw)),
                    DataCell(Text(bondsDisplay.toString())),
                    // DataCell(Text(prize)),
                  ]);
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}
