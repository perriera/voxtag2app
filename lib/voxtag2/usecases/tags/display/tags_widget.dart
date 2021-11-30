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
import 'package:voxtag2app/voxtag2/instance/Streams_Obsolete.dart';
import 'package:voxtag2app/voxtag2/options/Options.dart';

import '../../tag/display/tag_widget.dart';
import '../../tag/select/tag_select_widget.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({
    Key key,
    @required this.tag,
    this.horizontal = true,
    this.onSelect,
    this.deleteMode = false,
  }) : super(key: key);

  final String tag;
  final bool horizontal;
  final Function onSelect;
  final bool deleteMode;

  @override
  Widget build(BuildContext context) {
    if (!Options.displayTags || tag == null)
      return Container();
    else {
      List<String> tags = tag.split(" ");
      int cnt = 0;
      List<TagWidgetBase> widgets = [];
      for (String tag in tags) {
        if (tag.length > 0) {
          if (this.onSelect != null) {
            widgets.add(TagSelectWidget(
              tag: tag,
              onSelect: onSelect,
              deleteMode: deleteMode,
            ));
          } else {
            widgets.add(TagWidget(tag: tag));
            if (!horizontal) if (++cnt > 1) break;
          }
        }
      }
      return buildWidgets(widgets);
    }
  }

  Widget buildWidgets(List<TagWidgetBase> widgets) {
    if (horizontal)
      return buildHorizontalListing(widgets);
    else
      return buildVerticalListing(widgets);
  }

  Widget buildVerticalListing(List<TagWidgetBase> widgets) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: StreamBuilder<StatusBarUpdate>(
          stream: statusBarUpdate.stream,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgets,
            );
          }),
    );
  }

  Widget buildHorizontalListing(List<TagWidgetBase> widgets) {
    if (widgets.length < 3 && !deleteMode) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: widgets,
      );
    }
    List<Row> rows = [];
    String line = "";
    List<TagWidgetBase> rowWidgets = [];
    for (TagWidgetBase tagWidget in widgets) {
      String tag = tagWidget.getTag();
      line = line + tag;
      rowWidgets.add(tagWidget);
      if (line.length > (deleteMode ? 10 : 12)) {
        rows.add(wrapRow(rowWidgets));
        rowWidgets = [];
        line = "";
      }
    }
    if (rowWidgets.length > 0) {
      rows.add(wrapRow(rowWidgets));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: rows,
    );
  }

  Row wrapRow(List<TagWidgetBase> rowWidgets) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: rowWidgets,
    );
  }
}
