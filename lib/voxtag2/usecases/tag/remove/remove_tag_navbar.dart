import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

class RemoveTagNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeCatalog.kNavBarColor,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          NavBarButton(
            icon: FontAwesomeIcons.windowClose,
            title: 'Back',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
