import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sampleproject/EP%20Profile/ep.dart';
import 'package:sampleproject/Setting%20Screen/updateprofile.dart';
import '../EP Profile/Navbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final fnameController = TextEditingController();
  final contactController = TextEditingController();
  final cnicController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final accController = TextEditingController();
  final occController = TextEditingController();
  int maxLength = 11;
  int maxLength1 = 13;
  int maxLength2 = 17;
  @override


  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    fnameController.dispose();
    contactController.dispose();
    cnicController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    accController.dispose();
    occController.dispose();
  }

  Future<void> updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      final String name = nameController.text;
      final String email = emailController.text;
      final String fname = fnameController.text;
      final String contact = contactController.text;
      final String cnic = cnicController.text;
      final String address = addressController.text;
      final String city = cityController.text;
      final String country = countryController.text;
      final String accNumber = accController.text;
      final String occupation = occController.text;
      final CollectionReference user_profile =
      FirebaseFirestore.instance.collection('user_profile');

      // Create a document reference with a unique user ID
      final DocumentReference userRef = user_profile.doc('uid');



      await userRef.set({
        'name': name,
        'email': email,
        'fname': fname,
        'contact': contact,
        'cnic': cnic,
        'address': address,
        'city': city,
        'country': country,
        'accNumber': accNumber,
        'occupation': occupation,
      });


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully.'),
        ),
      );
    }
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
    title: Text("Edit Profile"),
    centerTitle: true,
    titleTextStyle: TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
    color: Colors.orange,
    ),
    elevation: 1,
    // leading: IconButton(
    // icon: Icon(
    // Icons.arrow_back,
    // color: Colors.orange,
    // ),
    // onPressed: () {
    // Navigator.pop(
    // context);
    // },
    // ),
    ),


        body: Container(
    padding: EdgeInsets.only(left: 16, top: 10, right: 16),
    child: GestureDetector(
    onTap: () {
    FocusScope.of(context).unfocus();
    },
    child: Form(
    key: _formKey,
    child: ListView(
      children: [
        TextFormField(
          inputFormatters: [
            // only accept letters from a to z
            FilteringTextInputFormatter(
                RegExp(r'[a-zA-Z]'), allow: true)
          ],
          controller: nameController,
          validator: ValidationBuilder().minLength(5, 'Enter a valid name').build(),

          decoration: InputDecoration(labelText: "Name"),
        ),
        TextFormField(
          controller: emailController,

          validator: ValidationBuilder().email('Enter a valid email').build(),
          decoration: InputDecoration(labelText: "Email"),
        ),
        TextFormField(
          controller: fnameController,
          validator: ValidationBuilder().minLength(3, 'Enter a valid name').build(),
          decoration: InputDecoration(labelText: "Father's Name"),
        ),
        IntlPhoneField(
          controller: contactController,
          validator: (phone) {
            if (phone == null || phone.completeNumber.isEmpty) {
              return 'Enter a valid contact number';
            }
            if (phone.completeNumber.length < maxLength) {
              return 'Contact number should be $maxLength digits';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Contact",
          ),
          initialCountryCode: 'PK',
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),

        TextFormField(
          controller: cnicController,
          validator: ValidationBuilder().maxLength(maxLength1, 'Enter a valid CNIC number').build(),
          decoration: InputDecoration(labelText: "CNIC"),
        ),
        TextFormField(
          controller: addressController,
          validator: ValidationBuilder().minLength(5, 'Enter a valid address').build(),
          decoration: InputDecoration(labelText: "Address"),
        ),
        TextFormField(
          controller: cityController,
          validator: ValidationBuilder().minLength(3, 'Enter a valid city').build(),
          decoration: InputDecoration(labelText: "City"),
        ),
        TextFormField(
          controller: countryController,
          validator: ValidationBuilder().minLength(3, 'Enter a valid country').build(),
          decoration: InputDecoration(labelText: "Country"),
        ),
        TextFormField(
          controller: accController,
          validator: ValidationBuilder().maxLength(maxLength2, 'Enter a valid account number').build(),
          decoration: InputDecoration(labelText: "Account Number"),
        ),
        TextFormField(
          controller: occController,
          validator: ValidationBuilder().minLength(3, 'Enter a valid occupation').build(),
          decoration: InputDecoration(labelText: "Occupation"),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: updateUserProfile,
          child: Text(
            "Save",
            style: TextStyle(fontSize: 16),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          ),
        ),
      ],
    ),
    ),

    ),

    ),


    );
  }
}

