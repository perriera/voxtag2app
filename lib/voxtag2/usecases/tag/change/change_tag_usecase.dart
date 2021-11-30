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
