import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/system/load_path.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';

class RefreshPhotosButton extends StatelessWidget {
  const RefreshPhotosButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.redo,
      title: "Refresh",
      onTap: () {
        PhotosAlbum().access(context);
      }, // RefreshPhotoUseCase(context),
    );
  }
}
