import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

import 'delete_tag_usecase.dart';

class DeleteTagMenuItem extends StatelessWidget {
  const DeleteTagMenuItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.trash),
        title: Text(
          "Delete Tag",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () => DeleteTagUseCase(context),
    );
  }
}
