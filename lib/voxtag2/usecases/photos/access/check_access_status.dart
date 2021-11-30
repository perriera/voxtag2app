///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// Permission is hereby  granted,  free of charge,  to  any  person
/// obtaining a copy of this software and  associated  documentation
/// files   (the  "Software"),  to deal  in   the  Software  without
/// restriction, including  without  limitation the rights  to  use,
/// copy,  modify, merge,  publish,  distribute,  sublicense, and/or
/// sell copies of the  Software, and to permit persons  to whom the
/// Software  is  furnished to  do  so,  subject  to  the  following
/// conditions:
///
/// (See LICENSE.md for complete details)
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/display_access_status.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photos_grid.dart';

class CheckAccessStatus extends StatefulWidget {
  final BuildContext context;
  CheckAccessStatus(
    this.context,
  );

  @override
  State<CheckAccessStatus> createState() => _CheckAccessStatusState();
}

class _CheckAccessStatusState extends State<CheckAccessStatus>
    with WidgetsBindingObserver {
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
          initialData: PermissionStatus.undetermined,
          stream: checkPermissions.stream,
          builder: (context, snapshot) {
            try {
              checkAccess(snapshot);
              return PhotosGrid();
            } catch (e) {
              return DisplayAccessStatus(msg: e);
            }
          }),
    );
  }

  void checkAccess(AsyncSnapshot<PermissionStatus> snapshot) {
    var accessingPhotosMsg = 'Accessing Photos ... ';
    if (snapshot.data == null)
      throw accessingPhotosMsg;
    else {
      switch (snapshot.data) {
        case PermissionStatus.granted:
          break;
        case PermissionStatus.denied:
          throw 'Photos access denied';
        case PermissionStatus.restricted:
          throw 'Photos access restricted';
        case PermissionStatus.undetermined:
          throw accessingPhotosMsg;
        case PermissionStatus.permanentlyDenied:
          throw 'Photos access denied';
        default:
          throw 'Photos access unknown';
      }
    }
  }
}
