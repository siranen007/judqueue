import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:judqueue/utility/background_painter.dart';
import 'package:judqueue/widget/sign_in.dart';

class UserAuthen extends StatefulWidget {
  UserAuthen({Key key}) : super(key: key);

  @override
  _UserAuthenState createState() => _UserAuthenState();
}

class _UserAuthenState extends State<UserAuthen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(animation: _controller.view),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: ValueListenableBuilder(
                valueListenable: showSignInPage,
                builder: (context, value, child) {
                  return PageTransitionSwitcher(
                    transitionBuilder: (child, animation, secondaryAnimaion) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimaion,
                        transitionType: SharedAxisTransitionType.vertical,
                        fillColor: Colors.transparent,
                        child: child,
                      );
                    },child: value ? SignIn() : Text('SignUp') ,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
