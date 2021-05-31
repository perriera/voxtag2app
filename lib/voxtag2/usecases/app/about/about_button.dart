import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

import 'about_dialogbox.dart';

class AboutVoxTag2Button extends StatelessWidget {
  const AboutVoxTag2Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Container(
          width: 25,
          child: Image.asset("images/logos/VoxTagIcon.png"),
        ),
        title: Text(
          "About",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () {
        // var data = PhotosAlbum().photoIds;
        // var cnt = data.photos.length;
        // ToastDialog(context).display("$cnt Photos loaded", false);
        AboutDialogBox bt = AboutDialogBox();
        PageNavigator(context, bt).jump();
      },
    );
  }
}
