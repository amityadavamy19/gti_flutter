import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gti/screens/profile_screen.dart';
import 'package:gti/screens/home_screen.dart';
import 'package:gti/screens/post_screen.dart';
import 'package:gti/screens/More_screen.dart';

class UpdatesScreen extends StatefulWidget {
  static const String id = 'Updates_screen';
  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushNamed(context, HomeScreen.id);
      } else if (index == 1) {
        Navigator.pushNamed(context, ProfileScreen.id);
      } else if (index == 2) {
        Navigator.pushNamed(context, PostScreen.id);
      } else if (index == 3) {
        Navigator.pushNamed(context, UpdatesScreen.id);
      } else if (index == 4) {
        Navigator.pushNamed(context, MoreScreen.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[],
        title: Text('Updates Screen'),
        backgroundColor: Color(0xFFe51a4b),
      ),
      //bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedFontSize: 10.0,
        iconSize: 28.0,
        unselectedFontSize: 10.0,
        selectedItemColor: Color(0xFFe5097f),
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_edit),
            title: Text('Write'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Text('Updates'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('View More'),
          ),
        ],
      ),
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
            )
          ],
        ),
      ),
    );
  }
}
