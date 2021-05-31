import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/columns/GridSizeUpdate.dart';
// import 'package:voxtag2app/voxtag3/app/themes.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/change_gridsize/gridsize_update.dart';

class ChangeColumnsButton extends StatelessWidget {
  const ChangeColumnsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ListTile(
          leading: Icon(FontAwesomeIcons.grin),
          title: Text(
            "Change Column Size",
            style: ThemeCatalog.kOptionsItemStyle,
          ),
        ),
        onTap: () => gridSizeUpdate.add(
              GridSizeUpdate.bump(),
            ));
  }
}
