///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// Permission is hereby  granted,  free of charge,  to  any  person
/// obtaining a copy of this software and  associated  documentation
/// files   (the  "Software"),  to deal  in   the  Software  without
/// restriction, including  without  limitation the rights  to  use,
/// copy,  modify, merge,  publish,  distribute,  sublicense, and/or
/// sell copies of the  Software, and to permit persons  to whom the
/// Software  is  furnished to  do  so,  subject  to  the  following
/// conditions:
///
/// (See LICENSE.md for complete details)
///

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
