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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/options/Options.dart';

import '../display/tag_widget.dart';

class TagSelectWidget extends TagWidgetBase {
  const TagSelectWidget({
    Key key,
    @required this.tag,
    @required this.onSelect,
    this.deleteMode = false,
  }) : super(key: key);

  final String tag;
  final Function onSelect;
  final bool deleteMode;

  String getTag() {
    return tag;
  }

  @override
  Widget build(BuildContext context) {
    print(Options.displayTags ? tag : "nope");
    return GestureDetector(
      onTap: () {
        onSelect(tag);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(50, 50, 10, 120),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            deleteMode
                ? Row(
                    children: <Widget>[
                      Container(
                        child: Icon(FontAwesomeIcons.check),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  )
                : Container(),
            // StreamBuilder<PhotoAlbumUpdate>(
            //     stream: photoAlbum.stream,
            //     builder: (context, snapshot) {
            //       return Text(
            //         Options.displayTags ? tag : "",
            //         style: ThemeCatalog.kTagLabelTextStyle.copyWith(
            //             fontSize:
            //                 CapExtension.fontFactorSize(context, tag, true)),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
