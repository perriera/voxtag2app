///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// Permission is hereby  granted,  free of charge,  to  any  person
/// obtaining a copy of this software and  associated  documentation
/// files   (the  "Software"),  to deal  in   the  Software  without
/// restriction, including  without  limitation the rights  to  use,
/// copy,  modify, merge,  publish,  distribute,  sublicense, and/or
/// sell copies of the  Software, and to permit persons  to whom the
/// Software  is  furnished to  do  so,  subject  to  the  following
/// conditions:
///
/// (See LICENSE.md for complete details)
///


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'photo_widget.dart';

class PhotoLoader extends StatelessWidget {
  static Image fileImage;
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
              fileImage = Image.file(
                File(filename),
                fit: BoxFit.contain,
              );
              return PhotoWidget(
                image: fileImage,
              );
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
