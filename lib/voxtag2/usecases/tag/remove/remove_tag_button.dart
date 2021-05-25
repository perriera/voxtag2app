import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';

import 'remove_tag_usecase.dart';

class RemoveTagButton extends StatelessWidget {
  final VoxTag voxTag;
  const RemoveTagButton({
    Key key,
    @required this.voxTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.minusCircle),
        title: Text(
          "Remove tag",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () => RemoveTagUseCase(context, voxTag),
    );
  }
}
