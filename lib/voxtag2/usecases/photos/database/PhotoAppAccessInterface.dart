import 'package:flutter/cupertino.dart';

abstract class PhotoAppAccessInterface {
  void access(BuildContext context);
  void refresh(BuildContext context);
  // void refresh();
  // void seek(VoxTag photoId);
  // PhotosUpdate selectedPhotos();
  // bool hasSelectedPhotos();
  // PermissionStatus get status;
  // PhotosUpdate get photoIds;
}
