import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/UseCaseInterface.dart';

import '../../tag/TagUpdateModeInterface.dart';
import 'search_tags_actions.dart';

class SearchTagsUseCase implements UseCaseInterface {
  final BuildContext context;

  SearchTagsUseCase(this.context) {
    try {
      checkPreconditions();
      var action = SearchTagsAction();
      tagActionMode.add(action);
      Navigator.pop(context);
      var msg = 'Select a tag to ${action.title}';
      ToastDialog(context).display(msg, false);
    } catch (e) {
      ToastDialog(context).display(e, false);
    }
  }

  void checkPreconditions() {}
}
