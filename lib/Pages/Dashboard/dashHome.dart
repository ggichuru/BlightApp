import 'package:blightclient/Pages/Dashboard/homeScreen.dart';
import 'package:blightclient/Pages/Dashboard/screens/farm.dart';
import 'package:blightclient/Pages/Dashboard/screens/home.dart';
import 'package:blightclient/Pages/Dashboard/screens/profile.dart';
import 'package:blightclient/Pages/Start/LoginSignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashHome extends StatefulWidget {
  @override
  _DashHomeState createState() => _DashHomeState();
}

class _DashHomeState extends State<DashHome> {
  int _selectedTabIndex = 0;
  List<Widget> tabs = [
    // Home(),
    Farm(),
    Profile()];

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
                        MaterialPageRoute(
                            builder: (context) => LoginSignupScreen()),
                        (Route<dynamic> route) => false);
                  });
                },
              )),
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
            child: Column(
              children: [
                // Icon(
                //   Icons.account_circle_outlined,
                //   size: 50,
                //   color: Colors.white,
                // ),
                Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                Text(
                  'Test User',
                  style: TextStyle(color: Colors.yellow , fontWeight: FontWeight.bold),
                ),
                Text('Kinangop, Kenya',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
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
        //BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_sharp), label: 'Farms'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
