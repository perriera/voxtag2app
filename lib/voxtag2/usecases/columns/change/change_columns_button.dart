///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// Permission is hereby  granted,  free of charge,  to  any  person
/// obtaining a copy of this software and  associated  documentation
/// files   (the  "Software"),  to deal  in   the  Software  without
/// restriction, including  without  limitation the rights  to  use,
/// copy,  modify, merge,  publish,  distribute,  sublicense, and/or
/// sell copies of the  Software, and to permit persons  to whom the
/// Software  is  furnished to  do  so,  subject  to  the  following
/// conditions:
///
/// (See LICENSE.md for complete details)
///

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
