import 'dart:async';

import 'package:rxdart/rxdart.dart';

///
/// PhotosActionInterface
///
abstract class PhotoUpdateInterface {}

class PhotoStream extends PhotoUpdateInterface {
  static void refresh() {
    photoAction.add(PhotoStream());
  }
}

///
/// PhotosActionInterface StreamController
///

StreamController<PhotoStream> photoAction = BehaviorSubject();
