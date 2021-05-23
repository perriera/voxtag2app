import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_album_manager/album_model_entity.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/app_bar.dart';
import 'package:voxtag2app/voxtag2/buttons/nav_bars/nav_bar.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';

import 'photo_loader.dart';
// import 'package:voxtag2app/voxtag3/app/themes.dart';
// import 'package:voxtag2app/voxtag3/control/photo_navbar.dart';
// import 'package:voxtag2app/voxtag3/models/educated_guess.dart';
// import 'package:voxtag2app/voxtag3/models/voxtag.dart';
// import 'package:voxtag2app/voxtag3/views/app/usecases/display_topbar/app_topbar.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/display_photo/photo_loader.dart';

class PhotoViewer extends StatelessWidget {
  static VoxTag voxTag;
  static AlbumModelEntity lastFetch;
  // static EducatedGuess educatedGuess;

  Widget build(BuildContext context) {
    // PhotosAlbum().seek(PhotoViewer.voxTag);
    return Scaffold(
      appBar: AppTopBar(),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: loadAlbumPhoto(),
      ),
      bottomNavigationBar: PhotosNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }

  Widget loadAlbumPhoto() {
    var id = voxTag.entity.localIdentifier;
    return FutureBuilder<Widget>(
        initialData: Container(child: Text('Getting path...')),
        future: Future<Widget>.delayed(
          Duration(seconds: 0),
          () async {
            try {
              AlbumModelEntity entity =
                  await PhotoAlbumManager.getOriginalResource(id);
              String filename = entity.originalPath;
              return PhotoLoader(filename: filename);
            } catch (error) {
              print('PhotoViewer:future() $error');
              return Container(child: Text(error));
            }
          },
        ),
        builder: (context, snapshot) {
          return snapshot.data;
        });
  }
}
