import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/obsolete/tags_widget.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/search/search_tags_actions.dart';

import 'TagUpdateModeInterface.dart';

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
          return FlatButton(
            autofocus: true,
            onPressed: () => snapshot.data.onTap(context, tag),
            padding: EdgeInsets.all(5),
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
