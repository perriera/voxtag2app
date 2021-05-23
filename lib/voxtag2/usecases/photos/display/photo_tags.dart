import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
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
    var tags = VoxTags().tagsList(photoId);
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
