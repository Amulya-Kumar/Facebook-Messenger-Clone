import 'package:facebook_messenger_clone/models/chat_model.dart';
import 'package:flutter/material.dart';

class PeopleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: dummyData.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          foregroundColor: Theme.of(context).primaryColor,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(dummyData[index].avatarUrl),
        ),
        title: Text(dummyData[index].name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
        trailing: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white24,
          ),
          child: Center(
            child: Icon(
              Icons.pan_tool,
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
