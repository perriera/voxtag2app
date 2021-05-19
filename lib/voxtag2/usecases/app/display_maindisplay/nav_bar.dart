import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/refresh/refresh_photos_button.dart';

class PhotosNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeCatalog.kNavBarColor,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RefreshPhotosButton(),
          RefreshPhotosButton(),
          RefreshPhotosButton(),
          RefreshPhotosButton(),
          // TagPhotosButton(),
          // SearchButton(),
          // PhotosMoreButton(),
        ],
      ),
    );
  }
}
