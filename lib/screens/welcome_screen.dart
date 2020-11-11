import 'package:gti/screens/home_screen.dart';
import 'package:gti/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gti/screens/profile_screen.dart';
import 'package:gti/services/Login.service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gti/screens/registration_screen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gti/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController contorller;
  Animation animation;
  static final FacebookLogin facebookSignIn = FacebookLogin();
  String _message = 'Log in/out by pressing the buttons below.';

  //Login with facebook

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');

        Map<String, dynamic> fbUser = jsonDecode(graphResponse.body);

        LoginService pushUser =
            LoginService(url: 'http://insydindemo.ml/gti/api/checkMail');

        Map<String, dynamic> resData = await pushUser.postData(
            fbUser['name'], fbUser['email'], fbUser['id']);
        if (resData != Null) {
          Navigator.pushNamed(context, ProfileScreen.id);
        }

        break;
      case FacebookLoginStatus.cancelledByUser:
        SnackBar snackBar2 = SnackBar(
          content: Text(
            'Login cancelled by the user.',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.green,
        );

        _scaffoldKey.currentState.showSnackBar(snackBar2);

        break;
      case FacebookLoginStatus.error:
        SnackBar snackBar3 = SnackBar(
          content: Text(
            'Something went wrong with the login process ${result.errorMessage}',
            style: TextStyle(color: Colors.red),
          ),
          backgroundColor: Colors.green,
        );

        _scaffoldKey.currentState.showSnackBar(snackBar3);
        break;
    }
  }

  void _googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
    try {
      await _googleSignIn.signIn();
      String gemail = _googleSignIn.currentUser.email;
      String gname = _googleSignIn.currentUser.displayName;
      String gphoto = _googleSignIn.currentUser.photoUrl;

      //print(gemail);
      //print(gphoto);
      //print(gname);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    contorller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(contorller);
    contorller.forward();
    contorller.addListener(() {
      setState(() {});
      //print(animation.value);
    });
  }

  @override
  void dispose() {
    contorller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 80.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            SizedBox(
                height: 245.0,
                width: 300.0,
                child: Carousel(
                  images: [
                    AssetImage('images/product-image1.jpg'),
                    AssetImage('images/product-image1.jpg'),
                    AssetImage('images/product-image1.jpg'),
                    ExactAssetImage("images/product-image1.jpg")
                  ],
                )),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.only(
                    top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'images/google-icon.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Google",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                textColor: Color(0xFF292929),
                color: Colors.white),
            SizedBox(
              height: 17.0,
            ),
            RaisedButton(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                padding: EdgeInsets.only(
                    top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.id);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'images/Facebook_icon.png',
                      height: 40.0,
                      width: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Facebook",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                textColor: Color(0xFF292929),
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}
