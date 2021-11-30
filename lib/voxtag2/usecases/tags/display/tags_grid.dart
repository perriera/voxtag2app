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
import 'package:voxtag2app/voxtag2/extensions/UBDError.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/instance/VoxTag2.dart';
import 'package:voxtag2app/voxtag2/usecases/columns/GridSizeInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/columns/GridSizeUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import '../../tag/display/tagged_widget.dart';

class TagsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      return StreamBuilder<GridSizeInterface>(
        initialData: GridSizeUpdate(3),
        stream: gridSizeUpdate.stream,
        builder: (context, snapshot) {
          List<String> allTags = VoxTags().instance.allTags();
          try {
            checkEmptySet(allTags);
            return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: snapshot.data.size.toDouble(),
                mainAxisSpacing: snapshot.data.size.toDouble(),
                crossAxisCount: snapshot.data.size,
                children: listTags(context, allTags));
          } catch (error) {
            return Text(
              error.toString(),
              style: ThemeCatalog.kTextFieldStyle,
            );
          }
        },
      );
    } catch (e) {
      return UBDError(
        msg: e,
        whereTo: VoxTag2.root,
      );
    }
  }

  void checkEmptySet(List<String> allTags) {
    if (allTags.length == 0) throw 'Tag some photos first';
  }

  List<Widget> textBoxes(BuildContext context, List<String> allTags) {
    List<Widget> widgets = [];
    widgets.add(Expanded(child: Text("Hello")));
    return widgets;
  }

  List<Widget> listTags(BuildContext context, List<String> allTags) {
    List<Widget> widgets = [];
    for (String tag in allTags) {
      widgets.add(TaggedWidget(
        tag: tag,
      ));
    }
    return widgets;
  }
}
