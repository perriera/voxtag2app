import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'help_dialog_box.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Container(
          width: 25,
          child: Icon(FontAwesomeIcons.helicopter),
        ),
        title: Text(
          "Help",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () {
        PageNavigator(context, HelpDialogBox()).jump();
      },
    );
  }
}
