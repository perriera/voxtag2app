import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';

import '../search/search_tags_actions.dart';
import 'TagUpdateModeInterface.dart';

class TagActionButton extends StatelessWidget {
  const TagActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TagUpdateModeInterface>(
      initialData: SearchTagsAction(),
      stream: tagActionMode.stream,
      builder: (context, snapshot) {
        return NavBarButton(
          icon: snapshot.data.icon,
          title: snapshot.data.title,
          onTap: () {
            var msg = 'Select a tag to ${snapshot.data.title}';
            ToastDialog(context).display(msg, true);
          },
        );
      },
    );
  }
}
