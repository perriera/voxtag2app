import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/buttons/nav_bars/photos_navbar.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display/app_bar.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/view_photos.dart';

class MainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(),
      body: PhotosView(context),
      bottomNavigationBar: PhotosNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }
}
