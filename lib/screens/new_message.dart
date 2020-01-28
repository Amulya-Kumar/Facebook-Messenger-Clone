import 'package:facebook_messenger_clone/models/chat_model.dart';
import 'package:facebook_messenger_clone/screens/messenger_home.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

bool _isSwitched = false;

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MessengerHome(),
              ),
            );
          },
        ),
        title: Text("New Message"),
        actions: <Widget>[
          Switch(
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColorDark,
            height: 50.0,
            child: Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Center(child: Text("To:")),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type a name or group'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColorDark,
              child: Column(
                children: <Widget>[
                  Visibility(
                    visible: !_isSwitched,
                    child: Container(
                      height: 50.0,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Container(
                              height: 35.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white24,
                              ),
                              child: Icon(
                                Icons.people,
                                size: 20.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "Create a New Group",
                              style: TextStyle(fontSize: 15.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 8.0),
                    child: Align(
                      child: Text(
                        "Suggested",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              NetworkImage(dummyData[index].avatarUrl),
                        ),
                        title: Text(dummyData[index].name),
                      ),
                      itemCount: dummyData.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
