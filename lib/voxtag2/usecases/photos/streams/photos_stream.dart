// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:voxtag2app/voxtag3/models/interfaces/voxtag_interface.dart';

// import '../../../../models/photos_album.dart';

// ///
// /// PhotosActionInterface
// ///
// abstract class PhotosUpdateInterface {
//   String get title;
//   IconData get icon;
// }

// class PhotosUpdate implements PhotosUpdateInterface {
//   final List<VoxTagInterface> photos;
//   PhotosUpdate(this.photos);
//   @overridephoto
//   String get title => "Update";
//   @override
//   IconData get icon => FontAwesomeIcons.redo;
// }

// class PhotosStream extends PhotosUpdate {
//   static void refresh() {
//     getDescAlbumImg.add(PhotosStream());
//   }

//   PhotosStream() : super(PhotosAlbum().photoIds.photos);
//   @override
//   String get title => "All";
//   @override
//   IconData get icon => FontAwesomeIcons.images;
// }

// ///
// /// PhotosActionInterface StreamController
// ///

// StreamController<PhotosUpdate> getDescAlbumImg = BehaviorSubject();
// StreamController<String> photosStreamError = BehaviorSubject();
