import 'package:blightclient/Pages/OnBoarding/OnBoarding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BlightClient',
        theme: ThemeData(
            primaryColor: Color(0xFFF5A627),
            scaffoldBackgroundColor: Colors.white),
        home: OnBoarding());
  }
}
