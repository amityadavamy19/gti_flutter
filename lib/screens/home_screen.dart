import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gti/screens/profile_screen.dart';
import 'package:gti/screens/post_screen.dart';
import 'package:gti/screens/Updates_screen.dart';
import 'package:gti/screens/More_screen.dart';
import 'package:gti/services/Posts.service.dart';
import 'package:gti/components/constants.dart';
import 'package:gti/screens/welcome_screen.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostsService Posts = PostsService(
      url: kUrl + 'getAllPosts?api_id=${kApiId}&api_key=${kApiKey}');

  Future<List<Mypost>> showData() async {
    var PostData = await Posts.getData();
    List<Mypost> Myposts = [];

    for (var p in PostData['data']) {
      Mypost mypost = Mypost(p['post_title'], p['post_title']);
      Myposts.add(mypost);
      // print(p['post_title']);
    }
    return Myposts;
  }

  int _selectedIndex = 0;
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

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Do you really want to exit the application'),
        actions: [
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: null,
            actions: <Widget>[],
            title: Text('Home'),
            backgroundColor: Color(0xFFe51a4b),
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontSize: 18.0),
              tabs: [
                Text("For You"),
                Text("Categories"),
              ],
            ),
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
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: FutureBuilder(
                future: showData(),
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                        child: Text('Loading'),
                      ),
                    );
                  } else {
                    return ListView.builder(
                        //scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            height: 200.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  width: 250.0,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Image.network(
                                                  'http://fitex.co.in/uploads/videos/product-image.jpg',
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                    snapshot.data[index].title),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Mypost {
  final String title;
  final String image;
  Mypost(this.title, this.image);
}
