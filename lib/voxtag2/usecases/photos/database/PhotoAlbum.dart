import 'package:flutter/material.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:toast/toast.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAppAccessInterface.dart';

class PhotosAlbum implements PhotoAppAccessInterface {
  void access(BuildContext context) {
    PhotoAlbumManager.checkPermissions().then((status) {
      Toast.show("Photos app access granted", context);
    }).catchError((error) {
      Toast.show("Photos app access denied", context);
    });
  }
}
