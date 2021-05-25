import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/app_bar.dart';
import 'package:voxtag2app/voxtag2/buttons/nav_bars/nav_bar.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'photo_view.dart';

class PhotoViewer extends StatelessWidget {
  static VoxTag voxTag;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: PhotoView(voxTag: voxTag),
      ),
      bottomNavigationBar: PhotosNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }
}
