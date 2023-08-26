import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sampleproject/Authentication/LogIn.dart';
import 'package:sampleproject/Investor%20Profile/investorLotto.dart';

import '../Navbar.dart';

class PostingData extends StatefulWidget {
  @override
  _PostingDataState createState() => _PostingDataState();
}

class _PostingDataState extends State<PostingData> {
  Map<String, bool> likeStatus = {};

  @override
  void initState() {
    super.initState();
    initializeLikedPosts();
  }

  Future<void> initializeLikedPosts() async {
    List<String> likedPosts = await fetchLikedPosts();

    setState(() {
      likedPosts.forEach((postId) {
        likeStatus[postId] = true; // Mark posts liked by the user as true
      });
    });
  }

  Future<List<String>> fetchLikedPosts() async {
    List<String> likedPosts = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('history')
        .where('likedby', isEqualTo: uid) // Replace uid with the actual user ID
        .get();
    likedPosts =
        querySnapshot.docs.map((doc) => doc['postid'] as String).toList();

    return likedPosts;
  }

  Future<void> like(final postData, final postId) async {
    var ref = FirebaseFirestore.instance.collection('history');
    try {
      // Check if a document with the same postid exists
      QuerySnapshot querySnapshot =
          await ref.where('postid', isEqualTo: postId).get();

      // If no existing document with the same postid is found, then add the new one
      if (querySnapshot.size == 0) {
        var data = {
          'title': postData['title'],
          'msg': postData['description'],
          'postedby': postData['createdBy'],
          'timestamp': Timestamp.now(),
          'likedby': uid,
          'postid': postId
        };
        await ref.add(data);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Post Liked'),
          duration: const Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Post already liked'),
          duration: const Duration(seconds: 2),
        ));
      }
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
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
        title: Text("View Post"),
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 27, fontWeight: FontWeight.w600, color: Colors.white),
        elevation: 1,
      ),
      body: Container(
        color: Colors.white, // Set the background color to grey
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('Posting')
              .where('approved', isEqualTo: 'true')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Failed to fetch data'),
              );
            }

            final postData = snapshot.data!.docs;
            if (postData.isEmpty) {
              return Center(
                child: Text('No data found'),
              );
            }

            return ListView.builder(
              itemCount: postData.length,
              itemBuilder: (BuildContext context, int index) {
                final data = postData[index].data();
                final postId = postData[index].id;
                final title = data['title'] ?? '';
                final description = data['description'] ?? '';
                final createdBy = data['createdBy'] ?? '';

                final isLiked = likeStatus[postId] ?? false;

                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue, // Change the title color here
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .black, // Change the description text color here
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Possted by: $createdBy', // Display the user who created the post
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // IconButton(
                            //   icon: Icon(
                            //     isLiked
                            //         ? Icons.favorite
                            //         : Icons.favorite_border,
                            //     color: isLiked ? Colors.red : null,
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       likeStatus[postId] = !isLiked;
                            //     });
                            //     if (likeStatus[postId] == true) {
                            //       like(postData[index], postId);
                            //     }
                            //   },
                            // ),
                            IconButton(
                              icon: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isLiked ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  likeStatus[postId] = !isLiked;
                                });
                                if (likeStatus[postId] == true) {
                                  like(postData[index], postId);
                                }
                              },
                            ),

                            IconButton(
                              icon: Icon(Icons.comment),
                              onPressed: () {
                                // Add your comment functionality here
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
