import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photo_tags.dart';

class PhotoWidget extends StatelessWidget {
  final Image image;
  final VoxTag photoId;

  const PhotoWidget({
    Key key,
    this.image,
    this.photoId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: image,
        ),
        GestureDetector(
          onTap: () {
            print('hello');
          },
          child: PhotoTagsPhoto(photoId: photoId),
        ),
      ],
    );
  }
}
