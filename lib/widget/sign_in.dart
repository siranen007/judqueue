import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:judqueue/customerscreen/welcome_customer.dart';
import 'package:judqueue/teacherscreen/welcome_tearcher.dart';
import 'package:judqueue/utility/decoration_function.dart';
import 'package:judqueue/utility/palette.dart';
import 'package:judqueue/utility/sign_in_up_bar.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = true;
  bool status = true; // true => wait for check user login
  String user, password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: signInInputDecoraton(hintText: 'Email'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: signInInputDecoraton(hintText: 'Password'),
                  ),
                ),
                SignInBar(
                  label: 'Sign In',
                  onPressed: () {
                    Firebase.initializeApp().then((value) => null);
                    // context.signInWithEmailAndPassword();
                  },
                  isLoading: isLoading,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      // onSignUpClicked?.call();
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Palette.darkBlue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Null> checkStatus() async {
    Firebase.initializeApp().then((value) {
      print('initializeApp OK');

      FirebaseAuth.instance.authStateChanges().listen((event) {
        if (event == null) {
          print('SignOut Status ');
          setState(() {
            status = false; // Show login page
          });
        } else {
          String uid = event.uid;

          print('SignIn Stutus uid ==>> $uid');

          checkType(uid);
        }
      });
    });
  }

  Future<Null> checkType(String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await FirebaseFirestore.instance
        .collection('Type')
        .doc(uid)
        .snapshots()
        .listen((event) {
      print('event ==>> ${event.data()}');
      String type = event.data()['Type'];
      print('Type ==>> $type');

      routeToService(type);
    });
  }

  void routeToService(String type) {
    switch (type) {
      case 'Teacher':
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeTeacher(),
            ),
            (route) => false);
        break;
      case 'Student':
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeCustomer(),
            ),
            (route) => false);
        break;
      default:
    }
  }
}
