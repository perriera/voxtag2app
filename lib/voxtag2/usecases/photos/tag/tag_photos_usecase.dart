import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/UseCaseInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import 'tag_photos_dialog.dart';

class TagPhotosUseCase implements UseCaseInterface {
  final BuildContext context;

  TagPhotosUseCase(this.context) {
    try {
      checkPreconditions();
      showModalBottomSheet(
        context: context,
        builder: (context) => TagPhotosDialog(
          update: (newTag, append) async {
            VoxTags().instance.tagSelected(newTag, append);
            VoxTags().instance.save();
            VoxTags().instance.clearSelected();
            PhotosAlbum().access(context);
          },
        ),
      );
    } catch (e) {
      ToastDialog(context).display(e, false);
    }
  }

  @override
  void checkPreconditions() {
    if (!VoxTags().instance.anySelected()) {
      throw "Tag some photos first";
    }
  }
}
