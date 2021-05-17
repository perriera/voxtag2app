import 'package:photo_album_manager/album_model_entity.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/instance/Streams.dart';
// import 'package:voxtag2app/voxtag3/app/streams.dart';
// import 'package:voxtag2app/voxtag3/models/tags_database.dart';
// import 'package:voxtag2app/voxtag3/models/voxtag.dart';

// import '../views/photos/usecases/display_photos/photos_stream.dart';
// import 'interfaces/photos_interface.dart';
// import 'interfaces/voxtag_interface.dart';

///
/// PhotosDatabase enums
///
enum VoxTagsCommands {
  init,
  refresh,
  seek,
}

///
/// PhotosDatabase
///
class PhotosAlbum /*implements PhotoAlbumInterface*/ {
  static PhotosAlbum _instance;
//  static PhotosUpdate _photosIds = PhotosUpdate(List<VoxTagInterface>());
  static PermissionStatus _status = PermissionStatus.undetermined;

  PhotosAlbum() {
    if (_instance == null) {
      _instance = this;
    }
  }
  void init() {
    voxTagsCommand.add(VoxTagsCommands.init);
    PhotoAlbumManager.checkPermissions().then((status) {
      _status = status;
      checkPermissions.add(status);
      // refresh();
    }).catchError((error) {
      // checkPermissionsError.add(error.toString());
    });
  }

  // PhotosUpdate convert(List<AlbumModelEntity> list) {
  //   List<VoxTag> voxTags = [];
  //   for (var item in list) {
  //     voxTags.add(VoxTag(entity: item));
  //     var id = item.localIdentifier;
  //     PhotoAlbumManager.getOriginalResource(id);
  //   }
  //   return PhotosUpdate(voxTags);
  // }

  // void refresh() {
  //   voxTagsCommand.add(VoxTagsCommands.refresh);
  //   PhotoAlbumManager.getDescAlbumImg().then((photos) {
  //     print('${photos.length} photos loaded');
  //     PhotosAlbum._photosIds = convert(photos);
  //     getDescAlbumImg.add(PhotosAlbum._photosIds);
  //   }).catchError((error) {
  //     photosStreamError.add(error.toString());
  //   });
  // }

  // @override
  // void seek(VoxTag photoId) {
  //   voxTagsCommand.add(VoxTagsCommands.seek);
  //   var entry = photoId.entity;
  //   var id = entry.localIdentifier;
  //   PhotoAlbumManager.getOriginalResource(id).then((entity) {
  //     print('getOriginalResource():${entity.originalPath}');
  //     getOriginalResource.add(entity);
  //   }).catchError((error) {
  //     print(error);
  //     getOriginalResourceError.add(error.toString());
  //   });
  // }

  @override
  PermissionStatus get status => _status;

  // @override
  // PhotosUpdate get photoIds => _photosIds;

  // @override
  // PhotosUpdate selectedPhotos() {
  //   List<VoxTag> list = [];
  //   for (VoxTag photoId in _photosIds.photos) {
  //     if (TagsDatabase().isSelected(photoId)) list.add(photoId);
  //   }
  //   return PhotosUpdate(list);
  // }

  // @override
  // bool hasSelectedPhotos() {
  //   return selectedPhotos().photos.length > 0;
  // }
}
