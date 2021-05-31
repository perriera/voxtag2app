import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voxtag2app/voxtag2/instance/Constants.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

class AppTopBar extends StatelessWidget with PreferredSizeWidget {
  AppTopBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return AppBar(
      title: Text(
        Constants.appTitle(),
        style: ThemeCatalog.kAppBarTextStyle,
      ),
    );
  }
}
