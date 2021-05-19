import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';

import 'VoxTagInterface.dart';

abstract class PhotosUpdateInterface {
  String get title;
  IconData get icon;
}

class PhotosUpdate implements PhotosUpdateInterface {
  final List<VoxTagInterface> photos;
  PhotosUpdate(this.photos);
  @override
  String get title => "Update";
  @override
  IconData get icon => FontAwesomeIcons.redo;
}

class PhotosStream extends PhotosUpdate {
  static void refresh() {
    getDescAlbumImg.add(PhotosStream());
  }

  PhotosStream() : super(PhotosAlbum().photoIds.photos);
  @override
  String get title => "All";
  @override
  IconData get icon => FontAwesomeIcons.images;
}
