import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/usecases/main/display/main_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';

import 'check_access_status.dart';
import 'directions_content.dart';

class AccessPhotosApp extends StatefulWidget {
  final String filename = "VoxTag2Setup";
  static String applicationDocumentsDirectory;

  const AccessPhotosApp({Key key}) : super(key: key);

  static void init(String applicationPath) {
    applicationDocumentsDirectory = applicationPath;
  }

  String get localPathname {
    var msg = '$applicationDocumentsDirectory/$filename.json';
    return msg;
  }

  @override
  _AccessPhotosAppState createState() => _AccessPhotosAppState();
}

class _AccessPhotosAppState extends State<AccessPhotosApp> {
  @override
  Widget build(BuildContext context) {
    if (isVoxTag2Installed())
      return CheckAccessStatus(context);
    else
      return DirectionsContent(
        success: onSuccess,
        diagnostic: onDiagnostic,
        fail: onFail,
      );
  }

  void onSuccess(status) {
    markVoxTag2Installed();
    // PhotosAlbum().refresh(context);
    // PageNavigator(context, MainDisplay()).jump();
  }

  void onDiagnostic(status) {
    print(status);
  }

  void onFail(error) {
    print(error);
  }

  void markVoxTag2Installed() {
    final file = File(widget.localPathname);
    var wrapped = "sample data";
    file.createSync();
    file.writeAsStringSync(wrapped);
  }

  bool isVoxTag2Installed() {
    final file = File(widget.localPathname);
    bool fileExists = file.existsSync();
    return fileExists;
  }
}
