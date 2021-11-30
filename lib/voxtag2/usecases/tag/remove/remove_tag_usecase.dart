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
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import '../../UseCaseInterface.dart';
import 'remove_tag_dialog.dart';

class RemoveTagUseCase implements UseCaseInterface {
  final BuildContext context;
  final VoxTag voxTag;

  RemoveTagUseCase(this.context, this.voxTag) {
    try {
      checkPreconditions();
      PageNavigator(context, RemoveTagDialog(voxTag: voxTag)).jump();
      PhotosAlbum().refresh(context);
    } catch (e) {
      ToastDialog(context).display(e, false);
    }
  }

  void checkPreconditions() {
    if (VoxTags().instance.tagsList(voxTag).length == 0)
      throw "No tags to remove";
  }
}
