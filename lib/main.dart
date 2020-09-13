import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:judqueue/utility/palette.dart';
import 'package:judqueue/widget/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.muliTextTheme(),
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            color: Palette.darkBlue,
          ),
        ),
        // home: LitAuthState(authenticated: WelcomeScreen(),
        // unauthenticated: MyHomePage(),),
        home: UserAuthen(),
      );
  }
}
