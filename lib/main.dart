import 'package:blightclient/Pages/Auth/AuthenticationService.dart';
import 'package:blightclient/Pages/Dashboard/homePage.dart';
import 'package:blightclient/Pages/Start/LoginSignupScreen.dart';
import 'package:blightclient/Pages/Start/StartScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BlightClient',
          theme: ThemeData(
              primaryColor: Color(0xFFF5A627),
              scaffoldBackgroundColor: Colors.white),
          home: AuthenticationWrapper()),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return LoginSignupScreen();
    // return StartScreen();
  }
}
