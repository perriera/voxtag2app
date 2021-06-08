import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAppAccessInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotosUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

import '../../voxtags/VoxTag.dart';

StreamController<PermissionStatus> checkPermissions = BehaviorSubject();
StreamController<PhotosUpdate> getDescAlbumImg = BehaviorSubject();

class PhotosAlbum implements PhotoAppAccessInterface {
  static PhotosAlbum _instance;
  static PhotosUpdate _photosIds = PhotosUpdate([]);
  static PermissionStatus _status = PermissionStatus.undetermined;

  @override
  PermissionStatus get status => _status;

  @override
  PhotosUpdate get photoIds => _photosIds;

  PhotosAlbum() {
    if (_instance == null) {
      _instance = this;
    }
  }

  @override
  void access(BuildContext context) {
    PhotoAlbumManager.checkPermissions().then((status) {
      checkPermissions.add(status);
      refresh(context);
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Photos app access denied");
    });
  }

  @override
  void refresh(BuildContext context) {
    PhotoAlbumManager.getDescAlbumImg().then((photos) {
      var msg = '${photos.length} photos loaded';
      Fluttertoast.showToast(msg: msg);
//      Toast.show(msg, context);
      PhotosAlbum._photosIds = convert(photos, context);
      getDescAlbumImg.add(PhotosAlbum._photosIds);
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Photos app access granted");
//      Toast.show("Photos app access granted", context);
    });
  }

  PhotosUpdate convert(List<AlbumModelEntity> list, BuildContext context) {
    List<VoxTagInterface> voxTags = [];
    try {
      for (var item in list) {
        voxTags.add(VoxTag(entity: item));
        // var id = item.localIdentifier;
        //  PhotoAlbumManager.getOriginalResource(id);
      }
    } catch (error) {
      Fluttertoast.showToast(msg: error.toString());
//      Toast.show(error.toString(), context);
    }
    return PhotosUpdate(voxTags);
  }
}
