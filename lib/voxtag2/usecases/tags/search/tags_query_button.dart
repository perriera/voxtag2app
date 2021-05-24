import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/toast/toast_dialog.dart';

class TagsQueryButton extends StatelessWidget {
  const TagsQueryButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.userTag,
      title: 'Tagged',
      onTap: () {
        ToastDialog(context).display("<not implemented yet>", true);
      },
    );
  }
}
