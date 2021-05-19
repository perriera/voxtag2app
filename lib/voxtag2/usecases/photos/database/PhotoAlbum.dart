import 'dart:async';

import 'package:flutter/material.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toast/toast.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAppAccessInterface.dart';

StreamController<PermissionStatus> checkPermissions = BehaviorSubject();

class PhotosAlbum implements PhotoAppAccessInterface {
  void access(BuildContext context) {
    PhotoAlbumManager.checkPermissions().then((status) {
      checkPermissions.add(status);
      refresh(context);
      Toast.show("Photos app access granted", context);
    }).catchError((error) {
      Toast.show("Photos app access denied", context);
    });
  }

  void refresh(BuildContext context) {
    PhotoAlbumManager.getDescAlbumImg().then((photos) {
      var msg = '${photos.length} photos loaded';
      Toast.show(msg, context);
    }).catchError((error) {
      Toast.show("Photos app access granted", context);
    });
  }
}
