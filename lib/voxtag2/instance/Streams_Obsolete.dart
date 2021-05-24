import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

enum PhotosDisplayMode {
  all,
  tagged,
  untagged,
  selected,
  results,
  clear,
}

StreamController<PhotoAlbumUpdate> photoAlbum = BehaviorSubject();
StreamController<PhotosDisplayMode> displayMode = BehaviorSubject();
StreamController<StatusBarUpdate> statusBarUpdate = BehaviorSubject();

class PhotoAlbumUpdate {
  final List<VoxTagInterface> listing;

  PhotoAlbumUpdate(this.listing);
}

class PhotoAlbumUpdating extends PhotoAlbumUpdate {
  PhotoAlbumUpdating(List<VoxTagInterface> listing) : super(listing);
}

class StatusBarUpdate {
  final int total;
  final int index;

  StatusBarUpdate(this.total, this.index);
}

class StatusBarUpdating extends StatusBarUpdate {
  StatusBarUpdating(int total, int index) : super(total, index);
}
