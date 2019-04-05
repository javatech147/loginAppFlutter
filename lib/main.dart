import 'package:flutter/material.dart';
import 'package:flutter_app_six/LoginScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "mChatApp",
    home: LoginScreen(),

    theme: ThemeData(
      primaryColor: Colors.pink,
      accentColor: Colors.amber
    ),
  ));
}
