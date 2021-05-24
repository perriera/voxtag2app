import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';

import 'tags_more_menu.dart';

class TagsMoreButton extends StatelessWidget {
  const TagsMoreButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.bars,
      title: 'More',
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => TagsMoreMenu(),
        );
      },
    );
  }
}
