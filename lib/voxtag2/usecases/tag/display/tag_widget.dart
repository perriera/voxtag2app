import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Streams_Obsolete.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/options/Options.dart';
import '../../../extensions/CapExtensions.dart';

class TagWidgetBase extends StatelessWidget {
  const TagWidgetBase({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container();
  }

  String getTag() {
    throw "Feature not implemented";
  }
}

class TagWidget extends TagWidgetBase {
  const TagWidget({
    Key key,
    @required this.tag,
  }) : super(key: key);

  final String tag;

  String getTag() {
    return tag;
  }

  TextStyle getStyle(BuildContext context) {
    return ThemeCatalog.kTagLabelTextStyle.copyWith(
      fontSize: CapExtension.fontFactorSize(context, tag, false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PhotoAlbumUpdate>(
        stream: photoAlbum.stream,
        builder: (context, snapshot) {
          return Container(
            decoration: Options.displayTags
                ? BoxDecoration(
                    color: Color.fromRGBO(50, 50, 10, 120),
                    borderRadius: BorderRadius.circular(5),
                  )
                : BoxDecoration(),
            padding: EdgeInsets.only(left: 4, right: 4),
            margin: EdgeInsets.only(left: 4, right: 4, bottom: 2),
            child: Text(
              Options.displayTags ? tag : "",
              style: getStyle(context),
            ),
          );
        });
  }
}
