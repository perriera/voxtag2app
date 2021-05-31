import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Constants.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/logo/whole_realm.dart';

import '../logo/app_logo.dart';

class AboutDialogBox extends StatefulWidget {
  @override
  _AboutDialogBoxState createState() => _AboutDialogBoxState();
}

class _AboutDialogBoxState extends State<AboutDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: ThemeCatalog.kMainColor,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Constants.padding,
                top: Constants.avatarRadius + Constants.padding,
                right: Constants.padding,
                bottom: Constants.padding),
            margin: EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: ThemeCatalog.kNavBarColor,
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: listItems(context),
          ),
        ],
      ),
    );
  }

  Column listItems(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AppLogoWidget(),
        SizedBox(
          height: 15,
        ),
        WholeRealmWidget(),
        SizedBox(
          height: 15,
        ),
        Text(
          "Patent Pending",
          style: ThemeCatalog.kDialogTitleStyle,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "All rights reserved, worldwide.",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 22,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(
                  fontSize: 18,
                  color: ThemeCatalog.kIconColor,
                ),
              )),
        ),
      ],
    );
  }
}
