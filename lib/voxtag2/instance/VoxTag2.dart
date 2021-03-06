///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// THE SOFTWARE IS  PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
/// EXPRESSED  OR   IMPLIED,  INCLUDING   BUT  NOT  LIMITED  TO  THE
/// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A  PARTICULAR PURPOSE
/// AND NON-INFRINGEMENT.  IN  NO  EVENT  SHALL EXPARX  INCORPORATED
/// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER  IN
/// AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  FROM, OUT  OF
/// OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR  OTHER DEALINGS
/// IN THE SOFTWARE.
///
/// (See LICENSE.md for complete details)
///


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:instabug_flutter/Instabug.dart';
import 'package:voxtag2app/voxtag2/instance/Constants.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/system/load_path.dart';
import 'package:voxtag2app/voxtag2/usecases/main/display/main_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/share/share_photo.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/access_photos_app.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/access/obsolete/TagStorage.dart';

class VoxTag2 extends StatefulWidget {
  static final String root = '/';
  static final String displayPhoto = '/displayPhoto';
  static final String photoSearch = '/photoSearch';

  @override
  State<VoxTag2> createState() => _VoxTag2State();
}

class _VoxTag2State extends State<VoxTag2> {
  bool initialized = false;

  void initApp(BuildContext context) {
    LoadPath.init().then((applicationPath) {
      print(applicationPath);
      TagsStorage.init(applicationPath);
      AccessPhotosApp.init(applicationPath);
      // PhotosAlbum().access(context);
    });
    initialized = true;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Instabug.start('a79bc45735944cf249dc13944420fa25', [InvocationEvent.shake]);
  // }

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
            title: Constants.appName(),
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
              VoxTag2.displayPhoto: (context) => PhotoDisplay(),
            },
            //  home: MainDisplay(),
          );
        });
  }
}
