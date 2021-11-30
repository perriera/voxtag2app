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
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view/photo_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photo_tags_base.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

class PhotoTags extends StatelessWidget {
  final VoxTag photoId;
  final bool thumb;
  const PhotoTags({
    Key key,
    this.photoId,
    this.thumb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = (photoId != null ? photoId : PhotoDisplay.voxTag);
    var tags = VoxTags().instance.tagsList(id);
    if (tags.isEmpty) return Container();
    return thumb
        ? VerticalPhotoTags(
            textStyle: ThemeCatalog.kTagLabelTextStyle.copyWith(
              fontSize: 15.0,
            ),
            tags: tags)
        : HorizontalPhotoTags(
            textStyle: ThemeCatalog.kTagLabelTextStyle.copyWith(
              fontSize: 30.0,
            ),
            tags: tags);
  }
}

class PhotoTagsThumb extends PhotoTags {
  final VoxTag photoId;
  const PhotoTagsThumb({
    Key key,
    this.photoId,
  }) : super(key: key, photoId: photoId, thumb: true);
}

class PhotoTagsPhoto extends PhotoTags {
  final VoxTag photoId;
  const PhotoTagsPhoto({
    Key key,
    this.photoId,
  }) : super(key: key, photoId: photoId, thumb: false);
}
