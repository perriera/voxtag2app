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
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/tag/display/tag_text.dart';

class ShadowedTag extends StatelessWidget {
  final TextStyle textStyle;
  final String tag;
  const ShadowedTag({
    Key key,
    this.textStyle,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(50, 50, 10, 120),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(left: 5, right: 10, top: 2, bottom: 2),
        margin: EdgeInsets.only(left: 5, right: 10, top: 2, bottom: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[TagText(textStyle: textStyle, tag: tag)],
        ));
  }
}

class ShadowedButton extends ShadowedTag {
  final String tag;
  ShadowedButton({this.tag})
      : super(
          tag: tag,
          textStyle: ThemeCatalog.kDialogTitleStyle.copyWith(
            color: Colors.white,
            fontSize: 25.toDouble(),
          ),
        );
}
