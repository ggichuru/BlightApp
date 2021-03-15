import 'package:blightclient/Pages/Auth/AuthenticationService.dart';
import 'package:blightclient/Pages/Dashboard/dashboard.dart';
import 'package:blightclient/Pages/OnBoarding/OnBoarding.dart';
import 'package:blightclient/Pages/Start/LoginSignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Config/locator.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt("initScreen");
  await preferences.setInt('initScreen', 1);
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BlightClient',
          theme: ThemeData(
              primaryColor: Color(0xFFF5A627),
              scaffoldBackgroundColor: Colors.white),
          //home: AuthenticationWrapper(),
          initialRoute: initScreen == 0 || initScreen == null ? 'onBoard' : 'home',
          routes: {
            'home' : (context) => AuthenticationWrapper(),
            'onBoard' : (context) => OnBoarding()
          },
          ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Dashboard();
    }
    return LoginSignupScreen();
    //return StartScreen();
  }
}
