import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/main/display/main_display_appbar.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/access_photos_app.dart';
import 'package:voxtag2app/voxtag2/usecases/main/display/main_display_navbar.dart';

class MainDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainDisplayTopBar(),
      body: AccessPhotosApp(),
      bottomNavigationBar: MainDisplayNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }
}
