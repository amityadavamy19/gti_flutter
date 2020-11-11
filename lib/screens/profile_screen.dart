import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gti/screens/welcome_screen.dart';
import 'package:gti/components/constants.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final messageController = TextEditingController();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushNamed(context, ProfileScreen.id);
      } else if (index == 1) {
        Navigator.pushNamed(context, ProfileScreen.id);
      } else if (index == 2) {
        Navigator.pushNamed(context, ProfileScreen.id);
      } else if (index == 3) {
        Navigator.pushNamed(context, ProfileScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[],
        title: Text('Profile'),
        backgroundColor: Color(0xFFe51a4b),
      ),
      //bottom Navigation

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/user.png'),
              minRadius: 20.0,
              maxRadius: 70.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text(
                  "Amit Kumar",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Text(
                  "amityadavamy19@gmail.com",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text(
                    "Posts 16",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text(
                    "Articles 16",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              FlatButton(
                child: Text('Sign Out'),
                color: Colors.black26,
                onPressed: () {
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
              )
            ]),
          ],
        ),
      ),
    );
  }
}
