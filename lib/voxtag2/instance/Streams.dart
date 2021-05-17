import 'dart:async';

//import 'package:photo_album_manager/album_model_entity.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access_photos/PhotosAlbum.dart';
//import 'package:voxtag2app/voxtag3/models/photos_album.dart';

///
/// VoxTag2 StreamController instances
///

StreamController<VoxTagsCommands> voxTagsCommand = BehaviorSubject();
StreamController<PermissionStatus> checkPermissions = BehaviorSubject();
//StreamController<String> checkPermissionsError = BehaviorSubject();
//StreamController<AlbumModelEntity> getOriginalResource = BehaviorSubject();
//StreamController<String> getOriginalResourceError = BehaviorSubject();
