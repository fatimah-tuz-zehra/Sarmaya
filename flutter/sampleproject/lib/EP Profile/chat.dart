import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Navbar.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _textEditingController = TextEditingController();

  void _sendMessage(String message) async {
    final user = FirebaseAuth.instance.currentUser;
    final loggedInUser = user?.email ?? 'Anonymous';

    try {
      await FirebaseFirestore.instance.collection('messages').add({
        'sender': loggedInUser,
        'message': message,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print('Error sending message: $e');
      // Handle error
    }

    _textEditingController.clear();
  }

  Widget _buildChatMessageList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('messages')
          .orderBy('timestamp')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        final messages = snapshot.data!.docs;

        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index].data() as Map<String, dynamic>;
            final sender = message['sender'] ?? '';
            final text = message['message'] ?? '';

            return ListTile(
              title: Text('$sender: $text'),
            );
          },
        );
      },
    );
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
        title: Text("Your Comunity"),
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
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildChatMessageList()),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _sendMessage(_textEditingController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
