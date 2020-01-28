import 'package:facebook_messenger_clone/screens/new_message.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 2.0, 10.0),
          child: CircleAvatar(
            foregroundColor: Theme.of(context).primaryColorDark,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
                "https://cdn2.f-cdn.com/contestentries/1316431/24595406/5ae8a3f2e4e98_thumb900.jpg"),
          ),
        ),
        title: Text(
          "Chats",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
        ),
        elevation: 0.5,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white12,
              ),
              child: Icon(
                Icons.camera_alt,
                size: 20.0,
              ),
            ),
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white12,
                ),
                child: Icon(
                  Icons.edit,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Text('123'),
    );
  }
}
