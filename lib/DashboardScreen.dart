import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Welcome to Dashboard",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
