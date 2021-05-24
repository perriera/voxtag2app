import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/GridSizeUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import 'TagUpdateModeInterface.dart';
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
