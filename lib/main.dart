import 'package:flutter/material.dart';
import 'package:gti/screens/inspiredpen_screen.dart';
import 'package:gti/screens/welcome_screen.dart';
import 'package:gti/screens/login_screen.dart';
import 'package:gti/screens/registration_screen.dart';
import 'package:gti/screens/profile_screen.dart';
import 'package:gti/screens/splash_screen.dart';
import 'package:gti/screens/home_screen.dart';
import 'package:gti/screens/post_screen.dart';
import 'package:gti/screens/Updates_screen.dart';
import 'package:gti/screens/More_screen.dart';

void main() => runApp(Gti());

class Gti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        RegistrationScreen.id: (context) => RegistrationScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        WelcomeScreen.id: (context) => WelcomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        InspiredpenScreen.id: (context) => InspiredpenScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        PostScreen.id: (context) => PostScreen(),
        UpdatesScreen.id: (context) => UpdatesScreen(),
        MoreScreen.id: (context) => MoreScreen(),
      },
    );
  }
}
