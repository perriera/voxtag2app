import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/view_status.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photos_grid.dart';

class PhotosView extends StatefulWidget {
  final BuildContext context;
  PhotosView(
    this.context,
  );

  @override
  State<PhotosView> createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> with WidgetsBindingObserver {
  List<String> events = [];

  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.toString());
    events.add(state.toString());
    if (state == AppLifecycleState.resumed) {
      PhotosAlbum().access(widget.context);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
