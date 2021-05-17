import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/extensions/CenterIt.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

class PhotosStatus extends StatelessWidget {
  final String msg;
  const PhotosStatus({
    Key key,
    this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenterIt(
      widget: Container(
        child: Text(
          msg,
          style: ThemeCatalog.kDialogTitleStyle,
        ),
      ),
    );
  }
}
