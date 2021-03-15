import 'package:blightclient/Pages/Dashboard/homePage.dart';
import 'package:blightclient/Pages/Dashboard/homeScreen.dart';
import 'package:blightclient/Pages/Dashboard/screens/farm.dart';
import 'package:blightclient/Pages/Dashboard/screens/home.dart';
import 'package:blightclient/Pages/Start/LoginSignupScreen.dart';
import 'package:blightclient/Pages/Start/StartScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashHome extends StatefulWidget {
  @override
  _DashHomeState createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  int _selectedTabIndex = 0;
  List<Widget> tabs = [Home(), Farm(), StartScreen(), HomeScreen()];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'BlightClient',
            style: TextStyle(color: Color(0xFF00713E)),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onPressed: () {
                  FirebaseAuth.instance.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginSignupScreen()),
                      (Route<dynamic> route) => false);
                });
              },
            )
          ),
        ],
      ),
      drawer: topDrawer(),
      body: tabs[_selectedTabIndex],
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget topDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Icon(
              Icons.account_box,
              size: 50,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF51822b),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 3'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 4'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black87,
      selectedItemColor: Color(0xFF00713E),
      selectedFontSize: 12,
      unselectedFontSize: 10,
      currentIndex: _selectedTabIndex,
      onTap: _changeIndex,
      items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.dashboard_sharp), label: 'Farm'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
