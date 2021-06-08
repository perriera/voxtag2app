import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display/main_display_appbar.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/view_photos.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display/main_display_navbar.dart';

class MainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainDisplayTopBar(),
      body: PhotosView(context),
      bottomNavigationBar: MainDisplayNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }
}
