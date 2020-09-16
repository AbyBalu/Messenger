import 'package:flutter/material.dart';
import 'package:greenlight_messenger/utils/universal_variables.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Widget title;
  final List<Widget> actions;
  final Widget leading;
  final bool centerTitle;

  const CustomAppBar({
    Key key,
    @required this.title,
    @required this.actions,
    @required this.leading, 
    @required this.centerTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color themeColor;
    var darkMode = MediaQuery.of(context).platformBrightness;
    darkMode == Brightness.dark
        ? themeColor = Color(0xff19191b)
        : themeColor = Colors.white;
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: themeColor,
        border: Border(
          bottom: BorderSide(
            color: UniversalVariables.separatorColor,
            width: 1.4,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        leading: leading,
        actions: actions,
        centerTitle: centerTitle,
        title: title,
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight+10);
}