import 'package:flutter/material.dart';
import 'package:greenlight_messenger/screens/signup_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    var pages = [
    PageViewModel(
      title: "Welcome to GreenLight",
      body:
          "One of the best way to keep in touch with you're friends and family.",
      image: Center(
          child: Image.asset("assets/img/group_chat.png", height: 250.0)),
    ),
    PageViewModel(
      title: "Respond quickly",
      body:
          "Collaborate with your friends and family with comments and direct mentions.",
      image: Center(
          child: Image.asset("assets/img/image_sharing.png", height: 250.0)),
    ),
    PageViewModel(
      title: "Stay connected",
      body:
          "Doing great work with your friends and family shouldn't stop when you're on the go.",
      image: Center(
          child: Image.asset("assets/img/video_calling.png", height: 250.0)),
    ),
    PageViewModel(
      title: "Safety",
      body:
          "You're totally secure, the more you know the less you worry.",
      image: Center(child: Image.asset("assets/img/secure.png", height: 250.0)),
    ),
    PageViewModel(
      title: "Let's get started!",
      body:
          "Getting started is easy! Create an account and you're in.",
      image: Center(
          child: Image.asset("assets/img/get_started.png", height: 250.0)),
    ),
  ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: IntroductionScreen(
            pages: pages,
            onDone: () {
              Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
            },
            onSkip: () {
              Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
            },
            showSkipButton: true,
            skip: Text("Skip"),
            next: Icon(Icons.arrow_right),
            done:
                InkWell(
                          child: Container(
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
                                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                                },
                                child: Center(
                                  child: Text("Sign up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",)),
                                ),
                              ),
                            ),
                          ),
                        ),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Colors.deepOrange,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          ),
        ),
      ),
    );
  }
}
