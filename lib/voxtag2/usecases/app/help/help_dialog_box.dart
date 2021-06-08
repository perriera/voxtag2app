import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Constants.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

import '../logo/app_logo.dart';

class HelpDialogBox extends StatefulWidget {
  @override
  _HelpDialogBoxState createState() => _HelpDialogBoxState();
}

class _HelpDialogBoxState extends State<HelpDialogBox> {
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
        Container(
          width: 200,
          child: AppLogoWidget(),
        ),
        Text(
          "User Help",
          style: ThemeCatalog.kDialogTitleStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Single click on a item to select",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "Double click on a item to open",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 22,
        ),
        Text(
          "Press the Mode button to switch",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "between Tag, Search & Share",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 22,
        ),
        Text(
          "'Allow Access to All Photos'",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "is required for VoxTag 2 to work",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 22,
        ),
        Text(
          "Press Refresh whenever the listing",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "of photos appears out of sync",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 22,
        ),
        Text(
          "Tags must be at least three",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "characters long",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 22,
        ),
        Text(
          "Sharing multiple photos is",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "limited my the devices memory",
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
                  color: Colors.white,
                ),
              )),
        ),
      ],
    );
  }
}
