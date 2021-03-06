import 'package:facebook_messenger_clone/screens/camera_page.dart';
import 'package:facebook_messenger_clone/screens/messenger_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Messenger",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MessengerHome(),
    );
  }
}