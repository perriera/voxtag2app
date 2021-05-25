import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/buttons/more_options_button.dart';
import 'package:voxtag2app/voxtag2/buttons/search_tags_button.dart';
import 'package:voxtag2app/voxtag2/buttons/tag_photos_button.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/buttons/refresh_photos_button.dart';

class PhotoNavBar extends StatelessWidget {
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
          // TagPhotosButton(),
          // SearchTagsButton(),
          MoreOptionsButton(),
        ],
      ),
    );
  }
}
