import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/share/share_photos_usecase.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

class SharePhotoButtonX extends StatelessWidget {
  final VoxTag voxTag;
  const SharePhotoButtonX({
    Key key,
    this.voxTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: Icons.share,
      title: 'Share',
      onTap: () {
        VoxTags().instance.select(voxTag);
        SharePhotosUseCase(context);
      },
    );
  }
}
