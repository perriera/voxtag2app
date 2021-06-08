import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_album_manager/album_model_entity.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:share/share.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/UseCaseInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import 'share_photos_dialog.dart';

class SharePhotosUseCase implements UseCaseInterface {
  final BuildContext context;
  List<String> imagePaths = [];

  SharePhotosUseCase(this.context) {
    try {
      checkPreconditions();
      _loadImagePaths();
      showModalBottomSheet(
        context: context,
        builder: (context) => SharePhotosDialog(
          update: (newTag, append) async {
            _onShare(context);
            VoxTags().instance.clearSelected();
            PhotosAlbum().refresh(context);
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
      throw "Select some photos first";
    }
  }

  _loadImagePaths() async {
    var photos = VoxTags().instance.allSelectedPhotos();
    for (VoxTag photo in photos) {
      var id = photo.entity.localIdentifier;
      AlbumModelEntity entity = await PhotoAlbumManager.getOriginalResource(id);
      String filename = entity.originalPath;
      imagePaths.add(filename);
    }
  }

  _onShare(BuildContext context) async {
    // A builder is used to retrieve the context immediately
    // surrounding the ElevatedButton.
    //
    // The context's `findRenderObject` returns the first
    // RenderObject in its descendent tree when it's not
    // a RenderObjectWidget. The ElevatedButton's RenderObject
    // has its position and size after it's built.
    final RenderBox box = context.findRenderObject() as RenderBox;

    if (imagePaths.isNotEmpty) {
      await Share.shareFiles(imagePaths,
          text: "Sample text",
          subject: "Sample subject",
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      ToastDialog(context).display("set imagePaths value", false);
    }
  }
}
