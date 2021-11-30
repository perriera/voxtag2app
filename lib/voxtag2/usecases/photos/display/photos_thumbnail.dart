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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/VoxTag2.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photo_tags.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

class PhotoThumbnail extends StatefulWidget {
  final AsyncSnapshot<FileImage> snapshot;
  final VoxTag photoId;
  const PhotoThumbnail({
    Key key,
    @required this.snapshot,
    @required this.photoId,
  }) : super(key: key);

  @override
  _PhotoThumbnailState createState() => _PhotoThumbnailState();
}

class _PhotoThumbnailState extends State<PhotoThumbnail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          VoxTags().instance.toggleSelect(widget.photoId);
        });
      },
      onDoubleTap: () {
        PhotoDisplay.voxTag = widget.photoId;
        Navigator.pushNamed(context, VoxTag2.displayPhoto);
      },
      child: Container(
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
            image: VoxTags().instance.isSelected(widget.photoId)
                ? AssetImage('images/selected/selected4.png')
                : AssetImage('images/selected/transparent.png'),
            fit: BoxFit.fill,
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(-.2, 0),
            image: widget.snapshot.data,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 20),
        child: PhotoTagsThumb(photoId: widget.photoId),
      ),
    );
  }
}
