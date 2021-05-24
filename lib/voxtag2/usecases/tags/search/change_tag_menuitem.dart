import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

import 'change_tag_usecase.dart';
// import 'package:voxtag2app/voxtag3/app/themes.dart';

// import 'change_tag_usecase.dart';

class ChangeTagMenuItem extends StatelessWidget {
  const ChangeTagMenuItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.edit),
        title: Text(
          "Change Tag",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () => ChangeTagUseCase(context),
    );
  }
}
