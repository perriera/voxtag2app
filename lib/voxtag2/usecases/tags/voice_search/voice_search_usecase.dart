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
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/UseCaseInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/search/search_tags_actions.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import 'voice_search_dialog.dart';

class VoiceSearchUseCase implements UseCaseInterface {
  final BuildContext context;

  VoiceSearchUseCase(this.context) {
    try {
      checkPreconditions();
      showModalBottomSheet(
        context: context,
        builder: (context) => VoiceSearchDialog(
          update: (tagToSearch, append) async {
            SearchTagsAction().onTap(context, tagToSearch);
          },
        ),
      );
    } catch (e) {
      ToastDialog(context).display(e, false);
    }
  }

  @override
  void checkPreconditions() {
    if (!VoxTags().instance.hasTags) {
      throw "Tag some photos first";
    }
  }
}
