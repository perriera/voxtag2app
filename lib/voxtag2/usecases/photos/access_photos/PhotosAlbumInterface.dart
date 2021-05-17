import 'package:photo_album_manager/photo_album_manager.dart';
// import 'package:voxtag2app/voxtag3/models/voxtag.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/display_photos/photos_stream.dart';

///
/// PhotosInterface
///
abstract class PhotoAlbumInterface {
  void init();
  // void refresh();
  // void seek(VoxTag photoId);
  // PhotosUpdate selectedPhotos();
  // bool hasSelectedPhotos();
  PermissionStatus get status;
  // PhotosUpdate get photoIds;
}

enum VoxTagsCommands {
  init,
  refresh,
  seek,
}
