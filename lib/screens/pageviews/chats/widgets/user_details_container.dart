import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:greenlight_messenger/enum/user_state.dart';
import 'package:greenlight_messenger/models/user.dart';
import 'package:greenlight_messenger/provider/user_provider.dart';
import 'package:greenlight_messenger/resources/auth_methods.dart';
import 'package:greenlight_messenger/screens/chatscreens/widgets/cached_image.dart';
import 'package:greenlight_messenger/screens/login_screen.dart';
import 'package:greenlight_messenger/widgets/appbar.dart';

import 'shimmering_logo.dart';

class UserDetailsContainer extends StatelessWidget {
  final AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    Color themeColor;
    Color revertThemeColor;
    var darkMode = MediaQuery.of(context).platformBrightness;
    darkMode == Brightness.dark
        ? themeColor = Color(0xff19191b)
        : themeColor = Colors.white;
    darkMode == Brightness.dark
        ? revertThemeColor = Colors.white
        : revertThemeColor = Color(0xff19191b);
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    signOut() async {
      final bool isLoggedOut = await AuthMethods().signOut();
      if (isLoggedOut) {
        // set userState to offline as the user logs out'
        authMethods.setUserState(
          userId: userProvider.getUser.uid,
          userState: UserState.Offline,
        );

        // move the user to login screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
        );
      }
    }

    return Container(
      color: themeColor,
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          CustomAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: revertThemeColor,
              ),
              onPressed: () => Navigator.maybePop(context),
            ),
            centerTitle: true,
            title: ShimmeringLogo(),
            actions: <Widget>[
              FlatButton(
                onPressed: () => signOut(),
                child: Text(
                  "Sign Out",
                  style: TextStyle(color: revertThemeColor, fontSize: 12),
                ),
              )
            ],
          ),
          UserDetailsBody(),
        ],
      ),
    );
  }
}

class UserDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color themeColor;
    Color revertThemeColor;
    var darkMode = MediaQuery.of(context).platformBrightness;
    darkMode == Brightness.dark
        ? themeColor = Color(0xff19191b)
        : themeColor = Colors.white;
    darkMode == Brightness.dark
        ? revertThemeColor = Colors.white
        : revertThemeColor = Color(0xff19191b);
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final User user = userProvider.getUser;

    return Container(
      color: themeColor,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          CachedImage(
            user.profilePhoto,
            isRound: true,
            radius: 50,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: revertThemeColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                user.email,
                style: TextStyle(fontSize: 14, color: revertThemeColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
