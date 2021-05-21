import 'dart:io' as io;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view_photo.dart';

import 'photo_widget.dart' as pi;

class PhotoLoader extends StatelessWidget {
  static FileImage fileImage;
  static String previousFileName;
  final String filename;
  const PhotoLoader({
    Key key,
    this.filename,
  }) : super(key: key);

//  Future<File> _getLocalFile(String filename) async {
//     String dir = (await getApplicationDocumentsDirectory()).path;
//     File f = new File('$dir/$filename');
//     return f;
//   }

  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello world"),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<Widget>(
  //       initialData: Container(child: Text('Loading image...')),
  //       future: Future<Widget>.delayed(
  //         Duration(seconds: 0),
  //         () async {
  //           try {
  //             var fi = FileImage(io.File(filename));
  //             PhotoLoader.fileImage = fi;
  //             previousFileName = filename;
  //             return pi.PhotoWidget(
  //               fileImage: fi,
  //               photoId: PhotoViewer.voxTag,
  //             );
  //           } catch (error) {
  //             var msg = 'PhotoLoader:future() $error';
  //             print(msg);
  //             return Container(child: Text(msg));
  //           }
  //         },
  //       ),
  //       builder: (context, snapshot) {
  //         return snapshot.data;
  //       });
  // }
}
