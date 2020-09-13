import 'package:flutter/material.dart';

class WelcomeCustomer extends StatefulWidget {
  @override
  _WelcomeCustomerState createState() => _WelcomeCustomerState();
}

class _WelcomeCustomerState extends State<WelcomeCustomer> {
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
