import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/refresh/refresh_photos_button.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/tags_query_button.dart';

import '../tag_actionbutton.dart';
import '../tags_more_button.dart';

class TagsNavBar extends StatelessWidget {
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
          TagsQueryButton(),
          TagActionButton(),
          TagsMoreButton(),
        ],
      ),
    );
  }
}
