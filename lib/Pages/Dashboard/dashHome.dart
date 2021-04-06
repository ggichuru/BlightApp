import 'package:blightclient/Pages/Dashboard/screens/farmScreen.dart';
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
    //Home(),
    FarmsScreen(),
    Profile(),
    ];

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF51822b).withOpacity(.85),
        title: Center(
          child: Text(
            'BlightClient',
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
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
                Icon(
                  Icons.account_circle_rounded,
                  size: 100,
                  color: Colors.black,
                ),
              
                    SizedBox(height: 6,),
                Text(
                  FirebaseAuth.instance.currentUser.email,
                  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 24),
                ),
                // Text( FirebaseAuth.instance.currentUser.phoneNumber,
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFF51822b).withOpacity(.85),
            ),
          ),
          ListTile(
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // ListTile(
          //   title: Text('Item 2'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   title: Text('Item 3'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          // ListTile(
          //   title: Text('Item 4'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow[700],
      backgroundColor: Color(0xFF51822b).withOpacity(.85),
      selectedFontSize: 12,
      unselectedFontSize: 10,
      currentIndex: _selectedTabIndex,
      onTap: _changeIndex,
      items: <BottomNavigationBarItem>[
       // BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_sharp), label: 'Farms'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
     //   BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Posts'),
      ],
    );
  }
}
