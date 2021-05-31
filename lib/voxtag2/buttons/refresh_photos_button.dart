import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/instance/VoxTag2.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display/main_display.dart';
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
          // Navigator.pushNamed(context, VoxTag2.root);
          PageNavigator(context, MainDisplay()).jump();
        });
  }
}
