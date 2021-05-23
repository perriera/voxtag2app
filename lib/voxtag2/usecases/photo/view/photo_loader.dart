import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'photo_widget.dart';

class PhotoLoader extends StatelessWidget {
  static FileImage fileImage;
  static String previousFileName;
  final String filename;
  const PhotoLoader({
    Key key,
    this.filename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        initialData: Container(child: Text('Loading image...')),
        future: Future<Widget>.delayed(
          Duration(seconds: 0),
          () async {
            try {
              return PhotoWidget(
                  image: Image.file(
                File(filename),
                fit: BoxFit.contain,
              ));
            } catch (error) {
              var msg = 'PhotoLoader:future() $error';
              print(msg);
              return Container(child: Text(msg));
            }
          },
        ),
        builder: (context, snapshot) {
          return snapshot.data;
        });
  }
}
