import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/take/take_photo_usecase.dart';

class TakePhotoMenuItem extends StatelessWidget {
  const TakePhotoMenuItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.camera),
        title: Text(
          "Take Picture",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () => TakePhotoUseCase(context),
    );
  }
}
