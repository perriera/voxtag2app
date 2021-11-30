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
import 'package:voxtag2app/voxtag2/usecases/tag/display/shadow_tag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';

class BasePhotoTags extends StatelessWidget {
  final VoxTag photoId;
  final List<String> tags;
  final int rowsMax;
  final int colsMax;
  const BasePhotoTags({
    Key key,
    @required this.textStyle,
    this.tags,
    this.photoId,
    this.rowsMax,
    this.colsMax,
  }) : super(key: key);

  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = buildList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list,
    );
  }

  List<Widget> buildList() {
    List<Widget> list = [];
    int max = rowsMax;
    for (var tag in tags) {
      tag = trimmed(tag);
      var widget = ShadowedTag(
        textStyle: textStyle,
        tag: tag,
      );
      list.add(widget);
      if (--max < 0) break;
    }
    return list;
  }

  String trimmed(String tag) {
    if (tag.length > colsMax) tag = tag.substring(0, colsMax);
    return tag;
  }
}

class HorizontalPhotoTags extends BasePhotoTags {
  final VoxTag photoId;
  final List<String> tags;
  final TextStyle textStyle;
  const HorizontalPhotoTags({
    Key key,
    @required this.textStyle,
    this.tags,
    this.photoId,
  }) : super(
            key: key,
            tags: tags,
            rowsMax: 5,
            colsMax: 15,
            textStyle: textStyle);
}

class VerticalPhotoTags extends BasePhotoTags {
  final VoxTag photoId;
  final List<String> tags;
  final TextStyle textStyle;
  const VerticalPhotoTags({
    Key key,
    @required this.textStyle,
    this.tags,
    this.photoId,
  }) : super(
            key: key,
            tags: tags,
            rowsMax: 2,
            colsMax: 10,
            textStyle: textStyle);
}
