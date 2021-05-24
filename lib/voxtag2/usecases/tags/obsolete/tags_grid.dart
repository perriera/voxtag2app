import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/extensions/UBDError.dart';
import 'package:voxtag2app/voxtag2/instance/VoxTag2.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/GridSizeInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/GridSizeUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import 'tagged_widget.dart';

class TagsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      return StreamBuilder<GridSizeInterface>(
        initialData: GridSizeUpdate(3),
        stream: gridSizeUpdate.stream,
        builder: (context, snapshot) {
          List<String> allTags = VoxTags().instance.allTags();
          checkEmptySet(allTags);
          return GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: snapshot.data.size.toDouble(),
              mainAxisSpacing: snapshot.data.size.toDouble(),
              crossAxisCount: snapshot.data.size,
              children: listTags(context, allTags));
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

  List<Widget> listTags(BuildContext context, List<String> allTags) {
    List<TaggedWidget> widgets = [];
    for (String tag in allTags) {
      widgets.add(TaggedWidget(tag: tag));
    }
    return widgets;
  }
}
