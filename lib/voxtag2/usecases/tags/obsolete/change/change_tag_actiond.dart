import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/GridSizeUpdate.dart';
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
                      VoxTags().instance..save();
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
