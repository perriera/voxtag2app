import 'package:flutter/cupertino.dart';

class PageNavigator {
  final BuildContext context;
  final Widget widget;

  PageNavigator(this.context, this.widget);

  void jump() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => widget,
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }
}
