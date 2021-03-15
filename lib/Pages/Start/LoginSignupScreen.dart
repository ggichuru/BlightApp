import 'package:blightclient/Config/locator.dart';
import 'package:blightclient/Config/pallet.dart';
import 'package:blightclient/Pages/Auth/googleSignin.dart';
import 'package:blightclient/Pages/Dashboard/dashboard.dart';
import 'package:blightclient/models/user.dart';
import 'package:blightclient/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;
  bool isLoading = false;

  final FirestoreService _firestoreService = locator<FirestoreService>();

  final DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("users");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          topContainer(),
          // Main container for signin and signup
          mainContainer(context),
          // Button login sign up
          buildBottomHalfContainer(),

          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(
                          Icons.plus_one, "Google", Palette.googleColor),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topContainer() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/start.jpg'),
                fit: BoxFit.fill)),
        child: Container(
          padding: EdgeInsets.only(top: 90, left: 20),
          color: Color(0xFF51822b).withOpacity(.85),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.yellow[700],
                      letterSpacing: 2),
                  children: [
                    TextSpan(
                      text: "BlightClient",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Text(
                isSignupScreen ? "SignUp to Continue" : "Login to Continue",
                style: TextStyle(color: Colors.white, letterSpacing: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainContainer(BuildContext context) {
    return Positioned(
      top: isSignupScreen ? 200 : 250,
      child: Container(
        padding: EdgeInsets.all(20),
        height: isSignupScreen ? 380 : 280,
        width: MediaQuery.of(context).size.width - 40,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5)
            ]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: !isSignupScreen
                                  ? Palette.activeColor
                                  : Palette.textColor1),
                        ),
                        if (!isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSignupScreen = true;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'SIGNUP',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSignupScreen
                                  ? Palette.activeColor
                                  : Palette.textColor1),
                        ),
                        if (isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          )
                      ],
                    ),
                  ),
                ],
              ),
              if (isSignupScreen) buildSignUpSection(),
              if (!isSignupScreen) buildLoginSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSignUpSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          buildTextField(
              Icons.person_outline, 'UserName', false, false, nameController),
          buildTextField(
              Icons.email_outlined, 'Email', false, true, emailController),
          buildTextField(
              Icons.lock_outlined, 'Password', true, false, passwordController),
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle(color: Palette.textColor2),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "term & conditions",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginSection() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          buildTextField(
            Icons.email_outlined,
            'Email',
            false,
            true,
            emailController,
          ),
          buildTextField(
              Icons.lock_outlined, 'Password', true, false, passwordController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Checkbox(
                      value: isRememberMe,
                      activeColor: Palette.textColor2,
                      onChanged: (value) {
                        setState(() {
                          isRememberMe = !isRememberMe;
                        });
                      }),
                  Text(
                    'Remember me',
                    style: TextStyle(fontSize: 12, color: Palette.textColor1),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 12, color: Palette.textColor1),
                ),
              ),
            ],
          )
        ]));
  }

  Widget buildBottomHalfContainer() {
    return Positioned(
      top: isSignupScreen ? 510 : 480,
      right: 0,
      left: 0,
      child: Center(
        child: GestureDetector(
          onTap: isSignupScreen ? clickSignup : clickLogin,
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.orange[200], Colors.red[400]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void clickLogin() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  void clickSignup() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      _firestoreService.createUser(Users(
        id: result.user.uid,
        email: emailController.text,
        name: nameController.text
      )).then((res) {
        isLoading = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.textColor1),
              borderRadius: BorderRadius.all(Radius.circular(35.0))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.textColor1),
              borderRadius: BorderRadius.all(Radius.circular(35.0))),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {
        signInWithGoogle();
      },
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
