import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/main/display/main_display_appbar.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/photo_display_navbar.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';

import 'photo_view.dart';

class PhotoDisplay extends StatelessWidget {
  static VoxTag voxTag;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainDisplayTopBar(),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: PhotoView(voxTag: voxTag),
      ),
      bottomNavigationBar: PhotoNavBar(voxTag: voxTag),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }
}
