import 'package:flutter/material.dart';
import 'package:greenlight_messenger/utils/universal_variables.dart';

class FloatingColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: UniversalVariables.fabGradient,
              border: Border.all(
                width: 2,
                color: UniversalVariables.gradientColorEnd,
              )),
          child: Icon(
            Icons.add_call,
            color: Colors.white,
            size: 25,
          ),
          padding: EdgeInsets.all(15),
        )
      ],
    );
  }
}
