import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/buttons/more_options_button.dart';

import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/buttons/refresh_photos_button.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_share_button.dart';
import 'package:voxtag2app/voxtag2/usecases/tag/remove/remove_tag_button.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';

class PhotoNavBar extends StatelessWidget {
  final VoxTag voxtag;

  const PhotoNavBar({Key key, this.voxtag}) : super(key: key);
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
          SharePhotoButton(),
          RemoveTagButton(voxTag: voxtag),
          MoreOptionsButton(),
        ],
      ),
    );
  }
}
