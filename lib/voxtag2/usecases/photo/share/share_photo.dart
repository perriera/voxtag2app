import 'dart:io';

import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_loader.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_widget.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

class PhotoShare extends StatefulWidget {
  @override
  _PhotoShareState createState() => _PhotoShareState();
}

class _PhotoShareState extends State<PhotoShare> with TickerProviderStateMixin {
  final _controller = ScreenshotController();
  BoxFit zoomLevel = BoxFit.fitWidth;
  bool showTags = true;

  ToastDialog toastDialog;
  @override
  void initState() {
    super.initState();
    toastDialog = ToastDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    var voxTag = PhotoDisplay.voxTag;
    return photoShare(voxTag, context);
  }

  var tag;

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  Future<void> shareFile() async {
    List<dynamic> docs = await DocumentsPicker.pickDocuments;
    if (docs == null || docs.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: docs[0] as String,
    );
  }

  Future<void> shareScreenShot() async {
    Directory directory;
    if (Platform.isAndroid)
      directory = await getExternalStorageDirectory();
    else
      directory = await getApplicationDocumentsDirectory();
    final String localPath =
        '${directory.path}/${DateTime.now().toIso8601String()}.png';
    await _controller.capture(/*path: localPath*/);
    await Future.delayed(Duration(seconds: 1));
    var title = "VoxTag photo";
    if (this.tag != null && this.tag != "") title = this.tag;
    await FlutterShare.shareFile(
      title: title,
      filePath: localPath,
    ).then((value) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        Navigator.pop(context);
        toastDialog.display("Photo shared", false);
      });
    });
  }

  Widget photoShare(VoxTagInterface voxTag, BuildContext context) {
    shareScreenShot();
    return GestureDetector(
      onTap: () {
        setState(() {
          // zoomLevel = PhotoWidget.changeZoomLevel(zoomLevel);
        });
      },
      onDoubleTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: ThemeCatalog.kMainColor,
        bottomNavigationBar: buildNavBar(context),
        body: Screenshot(
          controller: _controller,
          child: PhotoWidget(
            image: PhotoLoader.fileImage,
          ),
        ),
      ),
    );
  }

  Container buildNavBar(BuildContext context) {
    return Container(
      color: ThemeCatalog.kNavBarColor,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          NavBarButton(
            icon: Icons.share,
            title: 'Share',
            onTap: () {
              shareScreenShot();
            },
          ),
          NavBarButton(
            icon: FontAwesomeIcons.windowClose,
            title: 'Back',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
