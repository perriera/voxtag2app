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
import 'package:voxtag2app/voxtag2/usecases/tags/display/tags_widget.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/search/search_tags_actions.dart';

import '../TagUpdateModeInterface.dart';

class TaggedWidget extends StatelessWidget {
  final String tag;
  const TaggedWidget({
    Key key,
    @required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TagUpdateModeInterface>(
        initialData: SearchTagsAction(),
        stream: tagActionMode.stream,
        builder: (context, snapshot) {
          return TextButton(
            autofocus: true,
            onPressed: () => snapshot.data.onTap(context, tag),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                  // todo: replace this widget with VoxTag3 version
                  child: TagsWidget(
                tag: tag,
                horizontal: false,
              )),
            ),
          );
        });
  }
}
