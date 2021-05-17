import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/instance/Streams.dart';
import 'package:voxtag2app/voxtag2/usecases/app/access_photosapp/photos_status.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display_photos/photos_grid.dart';
// import 'package:photo_album_manager/photo_album_manager.dart';
// import 'package:voxtag2app/voxtag3/app/streams.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/display_photos/photos_grid.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/display_photos/photos_status.dart';

class PhotosView extends StatelessWidget {
  PhotosView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<PermissionStatus>(
          stream: checkPermissions.stream,
          builder: (context, snapshot) {
            try {
              checkAccess(snapshot);
              return PhotosGrid();
            } catch (e) {
              return PhotosStatus(msg: e);
            }
          }),
    );
  }

  void checkAccess(AsyncSnapshot<PermissionStatus> snapshot) {
    if (snapshot.data == null)
      throw 'Accessing Photos ... ';
    else {
      switch (snapshot.data) {
        case PermissionStatus.granted:
          break;
        case PermissionStatus.denied:
          throw 'Photos access denied';
        case PermissionStatus.restricted:
          throw 'Photos access restricted';
        case PermissionStatus.undetermined:
          throw 'Photos access undetermined';
        case PermissionStatus.permanentlyDenied:
          throw 'Photos access denied';
        default:
          throw 'Photos access unavailable';
      }
    }
  }
}
