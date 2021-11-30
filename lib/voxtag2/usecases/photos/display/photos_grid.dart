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

import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/usecases/columns/GridSizeInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/columns/GridSizeUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/display_access_status.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotosUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photos_spinner.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photos_thumbnail.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

class PhotosGrid extends StatelessWidget {
  PhotosGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PhotosUpdate>(
        initialData: PhotosAlbum().photoIds,
        stream: getDescAlbumImg.stream,
        builder: (context, snapshot) {
          try {
            checkEmptySet(snapshot);
            // TagsDatabase().align(snapshot.data.photos);
            return StreamBuilder<GridSizeInterface>(
                initialData: GridSizeUpdate(3),
                stream: gridSizeUpdate.stream,
                builder: (context, gridSnapshot) {
                  return GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: gridSnapshot.data.size.toDouble(),
                    mainAxisSpacing: gridSnapshot.data.size.toDouble(),
                    crossAxisCount: gridSnapshot.data.size,
                    children: listThumbnails(snapshot.data.photos),
                  );
                });
          } catch (e) {
            return DisplayAccessStatus(msg: e);
          }
        });
  }

  void checkEmptySet(AsyncSnapshot<PhotosUpdate> snapshot) {
    if (snapshot.data == null) throw 'No update given';
    if (snapshot.data.photos == null) throw 'No photos update given';
    if (snapshot.data.photos.length == 0) throw 'No photos found';
  }

  List<Widget> listThumbnails(List<VoxTagInterface> photos) {
    List<Widget> response = [];
    for (VoxTagInterface photo in photos) {
      Widget widget = FutureBuilder<FileImage>(
          future: Future<FileImage>.delayed(
            Duration(seconds: 0),
            () async {
              return FileImage(io.File(photo.thumbPath));
            },
          ),
          builder: (BuildContext context, AsyncSnapshot<FileImage> snapshot) {
            if (snapshot.data == null) {
              return PhotoSpinner();
            } else {
              return PhotoThumbnail(photoId: photo, snapshot: snapshot);
            }
          });
      response.add(widget);
    }
    return response;
  }
}
