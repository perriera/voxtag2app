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


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voxtag2app/voxtag2/options/Options.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotosUpdate.dart';

class TakePhotoDialog {
  final BuildContext context;
  final picker = ImagePicker();
  ToastDialog toastDialog;

  TakePhotoDialog(this.context) {
    toastDialog = ToastDialog(context);
  }

  Future takePhoto() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (pickedFile != null) {
      if (Platform.isIOS || await Options.deviceIsEmulator) {
        await GallerySaver.saveImage(pickedFile.path, albumName: 'Media');
        toastDialog.display("Photo saved", false);
        PhotosStream.refresh();
      } else {
        toastDialog.display("Photo acquired", false);
        PhotosStream.refresh();
      }
    }
  }
}
