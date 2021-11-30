///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// Permission is hereby  granted,  free of charge,  to  any  person
/// obtaining a copy of this software and  associated  documentation
/// files   (the  "Software"),  to deal  in   the  Software  without
/// restriction, including  without  limitation the rights  to  use,
/// copy,  modify, merge,  publish,  distribute,  sublicense, and/or
/// sell copies of the  Software, and to permit persons  to whom the
/// Software  is  furnished to  do  so,  subject  to  the  following
/// conditions:
///
/// (See LICENSE.md for complete details)
///

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
