import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.windowClose,
      title: 'Back',
      onTap: () => Navigator.pop(context),
    );
  }
}
