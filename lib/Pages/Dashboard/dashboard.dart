import 'package:blightclient/Pages/Dashboard/drawerScreen.dart';
import 'package:blightclient/Pages/Dashboard/dashHome.dart';
// import 'package:blightclient/Pages/Dashboard/homeScreen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          // HomeScreen()
         DashHome()
        ],
      ),
    );
  }
}
