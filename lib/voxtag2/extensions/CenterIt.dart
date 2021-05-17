import 'package:flutter/cupertino.dart';

class CenterIt extends StatelessWidget {
  final Widget widget;
  const CenterIt({
    Key key,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [widget],
        ),
      ],
    );
  }
}
