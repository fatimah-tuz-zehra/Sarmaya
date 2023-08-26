import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class post_verification extends StatefulWidget {
  const post_verification({Key? key}) : super(key: key);

  @override
  State<post_verification> createState() => _post_verificationState();
}

class _post_verificationState extends State<post_verification> {
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
        title: Text("Approve Posts"),
        centerTitle: true,
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Posting')
              .where('approved', isEqualTo: 'false')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              if (snapshot.data!.size == 0) {
                return Center(child: Text('No pending posts.'));
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final post = snapshot.data!.docs[index];
                  final title = post['title'];
                  final description = post['description'];

                  return Card(
                    child: ListTile(
                      title: Text(title),
                      subtitle: Text(description),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Verify the post by updating the 'verified' field
                          try {
                            post.reference.update({'approved': 'true'});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Post Approved!'),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            Fluttertoast.showToast(
                                msg: e.message!, gravity: ToastGravity.BOTTOM);
                          }
                        },
                        child: Text('Verify'),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went Wrong.'));
            } else {
              return Center(child: Text('No pending posts.'));
            }
          },
        ),
      ),
    );
  }
}
