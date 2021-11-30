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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/columns/GridSizeUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import '../TagUpdateModeInterface.dart';
import 'change_tag_dialog1.dart';
import 'change_tag_dialog2.dart';

//
///
/// TagsEditModeChange
/// When a displayed tag is clicked a tag change is performed
/// by asking the user to either enter a different one
///
class ChangeTagAction implements TagUpdateModeInterface {
  @override
  String get title => "Change";
  @override
  IconData get icon => FontAwesomeIcons.edit;
  void onTap(BuildContext context, String oldTag) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChangeTagDialog1(
        tagToDelete: oldTag,
        update: (newTag, yesNo) async {
          if (yesNo) {
            showModalBottomSheet(
              context: context,
              builder: (context) => ChangeTagDialog2(
                tagToChange: oldTag,
                update: (changeTag, yesNo) {
                  if (yesNo) {
                    try {
                      VoxTags().instance.changeTag(oldTag, changeTag);
                      VoxTags().instance.save();
                      GridSizeUpdate.refresh();
                    } catch (e) {
                      ToastDialog(context).display(e, false);
                    }
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }

  void checkParameters(String oldTag, String newTag) {
    if (oldTag == newTag) throw 'No changes made';
    if (newTag.length == 0) throw 'No changes made';
  }
}
