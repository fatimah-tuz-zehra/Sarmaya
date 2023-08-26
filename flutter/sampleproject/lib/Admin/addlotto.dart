import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class addlotto extends StatefulWidget {
  const addlotto({Key? key}) : super(key: key);

  @override
  State<addlotto> createState() => _addlottoState();
}

final formkey = GlobalKey<FormState>();
final Amount = TextEditingController();
final Range1 = TextEditingController();
final Range2 = TextEditingController();
final Prize = TextEditingController();
final desc3 = TextEditingController();
final price = TextEditingController();
final invo = TextEditingController();

class _addlottoState extends State<addlotto> {
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      super.dispose();
      Amount.dispose();
      Range1.dispose();
      Range2.dispose();
      Prize.dispose();
      desc3.dispose();
      price.dispose();
      invo.dispose();
    }

    @override
    void initState() {
      super.initState();
    }

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
        title: Text("Add Lotto"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Amount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: Amount,
                  validator: (value) {
                    if (value == "") {
                      return 'Amount cannot be left Empty.';
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '100',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                Text(
                  'Ticket number Range',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: Range1,
                  validator: (value) {
                    if (value == "") {
                      return 'Range cannot be left Empty.';
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '553500',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                TextFormField(
                  controller: Range2,
                  validator: (value) {
                    if (value == "") {
                      return 'Range cannot be left Empty.';
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '553600',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                Text(
                  'Prize Amount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: Prize,
                  validator: (value) {
                    if (value == "") {
                      return 'Prize cannot be left Empty.';
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: '10,000',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    upload();
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.deepOrange,
                    child: Center(
                        child: Text(
                      "Add Tickets",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future upload() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    final isValid = formkey.currentState!.validate();
    if (!isValid) return;
    int range1 = int.parse(Range1.text);
    int range2 = int.parse(Range2.text);
    int ticketnumber = range2 - range1;
    try {
      // if (name != null) {
      final docuser = FirebaseFirestore.instance.collection('Lotto');
      for (int i = 0; i < ticketnumber; i++) {
        final data = {
          'amount': int.parse(Amount.text),
          'Ticket': range1 + i,
          'Prize': int.parse(Prize.text),
          'Timestamp': Timestamp.now(),
          'Sold': 'no'
        };
        await docuser.add(data);
      }
      // }

      // Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Tickets Added!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }

    Navigator.pop(context);
  }
}
