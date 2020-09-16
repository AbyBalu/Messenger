import 'package:flutter/material.dart';
import 'package:greenlight_messenger/screens/callscreens/pickup/pickup_layout.dart';
import 'package:greenlight_messenger/screens/pageviews/logs/widgets/floating_column.dart';
import 'package:greenlight_messenger/widgets/greenlight_messenger_appbar.dart';

import 'widgets/log_list_container.dart';

class LogScreen extends StatelessWidget {
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
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: themeColor,
        appBar: GreenLightAppBar(
          title: "Calls",
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: revertThemeColor,
              ),
              onPressed: () => Navigator.pushNamed(context, "/search_screen"),
            ),
          ],
        ),
        floatingActionButton: FloatingColumn(),
        body: Padding(
          padding: EdgeInsets.only(left: 15),
          child: LogListContainer(),
        ),
      ),
    );
  }
}
