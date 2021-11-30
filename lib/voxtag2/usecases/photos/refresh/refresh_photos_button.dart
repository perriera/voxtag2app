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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/usecases/main/display/main_display.dart';
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
          PageNavigator(context, MainDisplay()).jump();
        });
  }
}
