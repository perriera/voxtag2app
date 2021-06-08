import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';

class SharePhotosButton extends StatelessWidget {
  const SharePhotosButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: Icons.share,
      title: 'Share',
      onTap: () {
        Navigator.pushNamed(context, '/photoShare');
      },
    );
  }
}
