import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voxtag2app/voxtag2/instance/Constants.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Constants.appName(),
        style: GoogleFonts.philosopher(
          textStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.normal,
            color: ThemeCatalog.kIconColor,
          ),
        ),
      ),
    );
  }
}
