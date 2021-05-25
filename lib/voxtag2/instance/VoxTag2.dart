import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/system/load_path.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/main_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/access/obsolete/TagStorage.dart';

class VoxTag2 extends StatelessWidget {
  static final String root = '/';
  static final String photoView = '/photoView';
  static final String photoShare = '/photoShare';
  static final String photoSearch = '/photoSearch';
  bool initialized = false;
  void initApp(BuildContext context) {
    LoadPath.init().then((applicationPath) {
      print(applicationPath);
      TagsStorage.init(applicationPath);
      // PhotosAlbum().init();
    });
    PhotosAlbum().access(context);
    initialized = true;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      initApp(context);
    }
    return StreamBuilder<Object>(
        initialData: 0,
        stream: themeSelection.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeCatalog.select(context, snapshot.data),
            // ThemeData(
            //   // This is the theme of your application.
            //   //
            //   // Try running your application with "flutter run". You'll see the
            //   // application has a blue toolbar. Then, without quitting the app, try
            //   // changing the primarySwatch below to Colors.green and then invoke
            //   // "hot reload" (press "r" in the console where you ran "flutter run",
            //   // or simply save your changes to "hot reload" in a Flutter IDE).
            //   // Notice that the counter didn't reset back to zero; the application
            //   // is not restarted.
            //   primarySwatch: Colors.blue,
            //   // This makes the visual density adapt to the platform that you run
            //   // the app on. For desktop platforms, the controls will be smaller and
            //   // closer together (more dense) than on mobile platforms.
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            // ),
            routes: <String, WidgetBuilder>{
              VoxTag2.root: (context) => MainDisplay(),
              VoxTag2.photoView: (context) => PhotoViewer(),
              // VoxTag3.photoShare: (context) => PhotoShare(),
              // VoxTag3.photoSearch: (context) => TagsSearchLayout(),
            },
            //  home: MainDisplay(),
          );
        });
  }
}
