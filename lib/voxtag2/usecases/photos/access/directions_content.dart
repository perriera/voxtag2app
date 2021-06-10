import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/instance/Constants.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/logo/app_logo.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/tag/display/shadow_tag.dart';

class DirectionsContent extends StatefulWidget {
  final Function success;
  final Function diagnostic;
  final Function fail;
  DirectionsContent({
    Key key,
    this.success,
    this.diagnostic,
    this.fail,
  }) : super(key: key);

  @override
  _DirectionsContentState createState() => _DirectionsContentState();
}

class _DirectionsContentState extends State<DirectionsContent> {
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
          "Permissions",
          style: ThemeCatalog.kDialogTitleStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Click the button below to request",
          style: ThemeCatalog.kAppBarTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "access to the Photos app",
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
        requestButton(context),
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

  TextButton requestButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'Request Access'),
      onPressed: () {
        PhotosAlbum().request(context, (status, context) {
          print(status);
          if (status == PermissionStatus.granted)
            widget.success(status);
          else
            widget.diagnostic(status);
        }, (error) {
          widget.fail(error);
        });
      },
    );
  }
}
