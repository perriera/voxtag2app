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
import 'package:voxtag2app/voxtag2/usecases/columns/GridSizeUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import '../TagUpdateModeInterface.dart';
import 'delete_tag_dialog.dart';

///
/// TagsEditModeDelete
/// When a displayed tag is clicked a tag delete is performed
/// by asking the user to confirm that the tag is to be deleted
///
class DeleteTagAction implements TagUpdateModeInterface {
  @override
  String get title => "Delete";
  @override
  IconData get icon => FontAwesomeIcons.trash;
  void onTap(BuildContext context, String tag) {
    showModalBottomSheet(
      context: context,
      builder: (context) => DeleteTagDialog(
        tagToDelete: tag,
        update: (deleteTag, yesNo) {
          if (yesNo) {
            try {
              VoxTags().instance.removeTag(deleteTag);
              VoxTags().instance.save();
              GridSizeUpdate.refresh();
            } catch (e) {
              print(e);
            }
          }
        },
      ),
    );
  }
}
