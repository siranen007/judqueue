import 'package:flutter/material.dart';

class WelcomeTeacher extends StatefulWidget {
  @override
  _WelcomeTeacherState createState() => _WelcomeTeacherState();
}

class _WelcomeTeacherState extends State<WelcomeTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Customer'),
      ),
      body: Stack(
        children: [Text('Customer Body'), Text('Tobe Build')],
      ),
    );
  }
}
