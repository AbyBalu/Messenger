import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenlight_messenger/resources/auth_methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenlight_messenger/custom_icons/custom_icons.dart';
import 'package:greenlight_messenger/custom_icons/social_icons.dart';
import 'package:greenlight_messenger/screens/signup_screen.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginscreen';
  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  bool isLoginPressed = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.greenAccent)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.greenAccent),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Color themeColor;
    var darkMode = MediaQuery.of(context).platformBrightness;
    darkMode == Brightness.dark
        ? themeColor = Colors.black
        : themeColor = Colors.white;
    ScreenUtil.init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/img/image_01.png"),
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(child: Image.asset("assets/img/image_02.png"))
              ],
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/logo/launcher_logo.png",
                          width: ScreenUtil().setWidth(200),
                          height: ScreenUtil().setHeight(200),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(180),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Login",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(55),
                                    fontFamily: "Poppins-Bold",
                                    letterSpacing: .6)),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
                            ),
                            Text("Email",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: ScreenUtil().setSp(35))),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30),
                            ),
                            Text("Password",
                                style: TextStyle(
                                    fontFamily: "Poppins-Medium",
                                    fontSize: ScreenUtil().setSp(35))),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(35),
                            ),
                            //Row(
                            //  mainAxisAlignment: MainAxisAlignment.end,
                            //  children: <Widget>[
                            //    Text(
                            //      "Forgot Password?",
                            //      style: TextStyle(
                            //          color: Colors.blue,
                            //          fontFamily: "Poppins-Medium",
                            //          fontSize: ScreenUtil().setSp(35)),
                            //    )
                            //  ],
                            //)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(40)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        //Row(
                        //  children: <Widget>[
                        //    SizedBox(
                        //      width: 12.0,
                        //    ),
                        //    GestureDetector(
                        //      onTap: _radio,
                        //      child: radioButton(_isSelected),
                        //    ),
                        //    SizedBox(
                        //      width: 8.0,
                        //    ),
                        //    Text("Remember me",
                        //        style: TextStyle(
                        //            fontSize: 12, fontFamily: "Poppins-Medium"))
                        //  ],
                        //),
                        InkWell(
                          child: Container(
                            width: ScreenUtil().setWidth(330),
                            height: ScreenUtil().setHeight(100),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.greenAccent[400],
                                  Color(0xFF6078ea)
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xFF6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  _signIn();
                                },
                                child: Center(
                                  child: Text("SIGNIN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        horizontalLine(),
                        Text("Social Login",
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: "Poppins-Medium")),
                        horizontalLine()
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //SocialIcon(
                        //  colors: [
                        //    Color(0xFF102397),
                        //    Color(0xFF187adf),
                        //    Color(0xFF00eaf8),
                        //  ],
                        //  iconData: CustomIcons.facebook,
                        //  onPressed: () {},
                        //),
                        SocialIcon(
                          colors: [
                            Color(0xFFff4f38),
                            Color(0xFFff355d),
                          ],
                          iconData: CustomIcons.googlePlus,
                          onPressed: () {
                            performLogin();
                          },
                        ),
                        //SocialIcon(
                        //  colors: [
                        //    Color(0xFF17ead9),
                        //    Color(0xFF6078ea),
                        //  ],
                        //  iconData: CustomIcons.twitter,
                        //  onPressed: () {},
                        //),
                        //SocialIcon(
                        //  colors: [
                        //    Color(0xFF00c6fb),
                        //    Color(0xFF005bea),
                        //  ],
                        //  iconData: CustomIcons.linkedin,
                        //  onPressed: () {},
                        //)
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User? ",
                          style: TextStyle(fontFamily: "Poppins-Medium"),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,SignUpScreen.routeName,(_)=>false);
                          },
                          child: Text("SignUp",
                              style: TextStyle(
                                  color: Color(0xFF5d74e3),
                                  fontFamily: "Poppins-Bold")),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(70),
                    ),
                  ],
                ),
              ),
            ),
            isLoginPressed
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container()
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String emailTxt = _emailController.text.trim();
    String passwordTxt = _passwordController.text;

    if (emailTxt.isNotEmpty && passwordTxt.isNotEmpty) {
      _auth
          .signInWithEmailAndPassword(email: emailTxt, password: passwordTxt)
          .then((user) {
        
        Navigator.pushNamedAndRemoveUntil(context,HomeScreen.routeName,(_)=>false);
        //showDialog(
        //    context: context,
        //    builder: (ctx) {
        //      return AlertDialog(
        //        shape: RoundedRectangleBorder(
        //          borderRadius: BorderRadius.circular(16),
        //        ),
        //        title: Text("Done"),
        //        content: Text("Successfully Signed in."),
        //        actions: <Widget>[
        //          FlatButton(
        //            child: Text("Ok"),
        //            onPressed: () {
        //              Navigator.of(ctx).pop();
        //            },
        //          ),
        //        ],
        //      );
        //    });
      }).catchError((e) {
        showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text("Error"),
                content: Text("${e.message}"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  ),
                ],
              );
            });
      });
    } else {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text("Error"),
              content: Text("Please provide email and password."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    _emailController.text = "";
                    _passwordController.text = "";
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            );
          });
    }
  }
  void performLogin() async {
  
    setState(() {
      isLoginPressed = true;
    });

    FirebaseUser user = await _authMethods.signIn();

    if (user != null) {
      authenticateUser(user);
    }
    setState(() {
      isLoginPressed = false;
    });
  }

  void authenticateUser(FirebaseUser user) {
    _authMethods.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = false;
      });

      if (isNewUser) {
        _authMethods.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        });
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
    });
  }
}
