import 'package:flutter/material.dart';

class CustomViewModel {
  ///Index of page
  final int index;
  /// Title of page
  final String title;

  /// Title of page
  final Widget titleWidget;

  /// Text of page (description)
  final String body;

  /// Widget content of page (description)
  final Widget bodyWidget;

  ///
  final Icon floatIcon;

  ///
  final Icon topRightIcon;


  CustomViewModel({
    this.index,
    this.title,
    this.titleWidget,
    this.body,
    this.bodyWidget,
    this.floatIcon,
    this.topRightIcon
  })  : assert(
          index != null,
          "You must provide either title (String) or titleWidget (Widget).",
        ),
        assert(
          title != null || titleWidget != null,
          "You must provide either title (String) or titleWidget (Widget).",
        ),
        assert(
          (title == null) != (titleWidget == null),
          "You can not provide both title and titleWidget.",
        ),
        assert(
          body != null || bodyWidget != null,
          "You must provide either body (String) or bodyWidget (Widget).",
        ),
        assert(
          (body == null) != (bodyWidget == null),
          "You can not provide both body and bodyWidget.",
        );
}
