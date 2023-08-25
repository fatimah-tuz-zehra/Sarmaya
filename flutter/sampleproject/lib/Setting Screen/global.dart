import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var name = '';
var fathername = '';
var email = '';
var acc = '';
var address = '';
var cnic = '';
var contact = '';
var country = '';
var city = '';
var occupation = '';
Future<void> readdata(User user) async {
  await FirebaseFirestore.instance
      .collection('user_profile')
      .doc(user.uid)
      .get()
      .then((value) {
    name = value['name'];
    fathername = value['fname'];
    acc = value['accNumber'];
    address = value['address'];
    cnic = value['cnic'];
    contact = value['contact'];
    country = value['country'];
    city = value['city'];
    occupation = value['occupation'];

    // address = value['Address'];
    // phone = value['Phone'].toString();
    // role = value['role'];
  });
}
