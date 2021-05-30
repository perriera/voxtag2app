import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ListTile(
          leading: Icon(FontAwesomeIcons.dashcube),
          title: Text(
            "Change theme: ${ThemeCatalog.kThemeName}",
            style: ThemeCatalog.kOptionsItemStyle,
          ),
        ),
        onTap: () {
          ThemeCatalog.bump();
          PhotosAlbum().refresh(context);
        });
  }
}
