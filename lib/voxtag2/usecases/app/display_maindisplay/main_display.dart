import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/app_bar.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/nav_bar.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/photos_view.dart';

class MainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(),
      body: PhotosView(),
      bottomNavigationBar: PhotosNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }
}
