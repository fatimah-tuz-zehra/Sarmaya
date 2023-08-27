import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class openlotto extends StatefulWidget {
  const openlotto({Key? key}) : super(key: key);

  @override
  State<openlotto> createState() => _openlottoState();
}

class _openlottoState extends State<openlotto> {
  bool visible = false;
  final Draw = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Draw.dispose();
    super.dispose();
  }

  List<int> ticketNumbers = [];
  List<int> selectedBonds = [];
  List<int> selectedTicketNumbers = [];
  List<int> selectedBondPrize = [];
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
        title: Text("Open Lotto"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Draw Number',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: Draw,
                  validator: (value) {
                    if (value == "") {
                      return 'Draw cannot be left Empty.';
                    } else
                      return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '10',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _fetchTicketNumbers();
                    setState(() {
                      visible = true;
                    });
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: 130,
                    color: Colors.deepOrange,
                    child: Center(
                        child: Text(
                      textAlign: TextAlign.center,
                      "Generate Winning Tickets",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: visible,
                  child: Text(
                    'Winning Tickets',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Column(
                  children: selectedTicketNumbers
                      .map(
                        (number) => Text(
                          number.toString(),
                          style: TextStyle(fontSize: 24),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: visible,
                  child: GestureDetector(
                    onTap: () {
                      upload();
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: 130,
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Update Lottery",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<int> _getRandomTicketNumbers(int count) {
    if (ticketNumbers.isEmpty || count <= 0) return [];

    final Random random = Random();
    List<int> randomTicketNumbers = [];

    while (randomTicketNumbers.length < count) {
      int randomIndex = random.nextInt(ticketNumbers.length);
      int selectedNumber = ticketNumbers[randomIndex];

      if (!randomTicketNumbers.contains(selectedNumber)) {
        randomTicketNumbers.add(selectedNumber);
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(selectedNumber.toString())));
      }
    }

    return randomTicketNumbers;
  }

  Future<void> _fetchTicketNumbers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Purchased Lotto').get();

    // Extract ticket numbers from documents and populate the list
    ticketNumbers =
        querySnapshot.docs.map((doc) => doc['ticketnumber'] as int).toList();

    // Replace 5 with the number of ticket numbers you want to select
    selectedTicketNumbers =
        _getRandomTicketNumbers(3); // Change the count as needed
    // upload();
    setState(() {});
  }

  Future upload() async {
    try {
      final docuser = FirebaseFirestore.instance.collection('Opened Lotto');

      final data = {
        'Draw Number': int.parse(Draw.text),
        'Bond1': selectedTicketNumbers[0],
        'Bond2': selectedTicketNumbers[1],
        'Bond3': selectedTicketNumbers[2],
        'Timestamp': Timestamp.now(),
      };
      await docuser.add(data);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Tickets Added!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
