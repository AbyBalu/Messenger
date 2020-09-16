import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greenlight_messenger/models/user.dart';
import 'package:greenlight_messenger/resources/auth_methods.dart';
import 'package:greenlight_messenger/screens/onboarding_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
      
        (status) {
          if (status) {
            _navigate();
          } 
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }

  void _navigate() async{
    if (await FirebaseAuth.instance.currentUser() != null) {
    // signed in
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen()
      )
    );
} else {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => OnBoardingScreen()
      )
    );

}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Opacity(
                    opacity: 0.5,
                    child: Container(
                      child: Image.asset('assets/logo/logo.png',
                      width: 75,
                      height: 75,
                      color: Colors.black12,),
                    )
                ),

                Shimmer.fromColors(
                  period: Duration(milliseconds: 1500),
                  baseColor: Colors.greenAccent[400],
                  highlightColor: Color(0xFF6078ea),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Image.asset('assets/logo/logo.png',
                    width: 70,
                    height: 70,
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authMethods.getUserDetails(),
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}