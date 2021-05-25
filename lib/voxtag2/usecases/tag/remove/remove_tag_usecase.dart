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
