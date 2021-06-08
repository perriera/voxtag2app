import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/tag/tag_photos_usecase.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/share/share_photos_usecase.dart';

class MultipassButton extends StatelessWidget {
  const MultipassButton({
    Key key,
  }) : super(key: key);

  static int mode = 0;
  static void bump() {
    mode++;
  }

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: Icons.share,
      title: _doTitle(context),
      onTap: () => _doButton(context),
    );
  }

  String _doTitle(BuildContext context) {
    if (mode == 0)
      return 'Tag';
    else
      return 'Share';
  }

  _doButton(BuildContext context) {
    if (mode == 0)
      return TagPhotosUseCase(context);
    else
      return SharePhotosUseCase(context);
  }
}
