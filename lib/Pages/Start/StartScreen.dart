import 'package:blightclient/Pages/Auth/Login/login.dart';
import 'package:blightclient/Pages/Auth/Signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToRegister() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.0),
              Container(
                height: 400,
                child: Image(
                  image: AssetImage("assets/images/start.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Welcome to ',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'BlightClient',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF5A627)))
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Eliminating potato blight',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: navigateToLogin,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF5A627),
                      elevation: 5,
                      shadowColor: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                      ),
                      padding: EdgeInsets.only(left:30,right:30),
                    )
                  ),
                  SizedBox(width: 20.0),
                  
                  ElevatedButton(
                    onPressed: navigateToRegister,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF5A627),
                      elevation: 5,
                      shadowColor: Colors.orangeAccent,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                      ),
                      padding: EdgeInsets.only(left:30,right:30),
                    )
                  ),
                ],
              ),
              SizedBox(height: 15,),

              SignInButton(
                Buttons.Google,
                text: 'Signup with Google',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
