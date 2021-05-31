import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';

import '../../UseCaseInterface.dart';
import '../TagUpdateModeInterface.dart';
import 'change_tag_action.dart';

class ChangeTagUseCase implements UseCaseInterface {
  final BuildContext context;

  ChangeTagUseCase(this.context) {
    try {
      checkPreconditions();
      var action = ChangeTagAction();
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
