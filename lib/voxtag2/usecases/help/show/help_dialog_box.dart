import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Constants.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

import 'app_logo.dart';

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
        Align(
          alignment: Alignment.bottomRight,
          child: FlatButton(
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
