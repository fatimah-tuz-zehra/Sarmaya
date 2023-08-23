import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0.0;
  TextEditingController _feedbackController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _submitRating() {
    _firestore.collection('feedback').add({
      'rating': _rating,
      'feedbackText': _feedbackController.text,
    }).then((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Rating submitted successfully'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to submit rating. Please try again.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rating'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Rate your experience:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Slider(
              value: _rating,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _feedbackController,
              decoration: InputDecoration(
                labelText: 'Enter your feedback',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRating,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
