import 'package:flutter/cupertino.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotosUpdate.dart';

abstract class PhotoAppAccessInterface {
  void request(BuildContext context, Function pass, Function fail);
  void access(BuildContext context);
  void refresh(BuildContext context);
  PermissionStatus get status;
  PhotosUpdate get photoIds;
  // void refresh();
  // void seek(VoxTag photoId);
  // PhotosUpdate selectedPhotos();
  // bool hasSelectedPhotos();
  // PermissionStatus get status;
  // PhotosUpdate get photoIds;
}
