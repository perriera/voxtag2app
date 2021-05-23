import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/take/take_photo_dialog.dart';

import '../../UseCaseInterface.dart';

class TakePhotoUseCase implements UseCaseInterface {
  final BuildContext context;

  TakePhotoUseCase(this.context) {
    try {
      checkPreconditions();
      TakePhotoDialog camera = TakePhotoDialog(context);
      camera.takePhoto();
    } catch (e) {
      ToastDialog(context).display(e, false);
    }
  }

  void checkPreconditions() {}
}
