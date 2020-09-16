import 'package:flutter/material.dart';
import 'package:greenlight_messenger/widgets/appbar.dart';

class GreenLightAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  final List<Widget> actions;

  const GreenLightAppBar({
    Key key,
    @required this.title,
    @required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color revertThemeColor;
    var darkMode = MediaQuery.of(context).platformBrightness;
    darkMode == Brightness.dark
        ? revertThemeColor = Colors.white
        : revertThemeColor = Color(0xff19191b);
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.notifications,
          color: revertThemeColor,
        ),
        onPressed: () {},
      ),
      title: (title is String)
          ? Text(
              title,
              style: TextStyle(
                color: revertThemeColor,
                fontWeight: FontWeight.bold,
              ),
            )
          : title,
      centerTitle: true,
      actions: actions,
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);
}
