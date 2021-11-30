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
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/share/share_photos_button.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/tag/tag_photos_button.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/search/search_tags_button.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/voice_search/voice_search_button.dart';

import 'multipass_stream.dart';

class MultipassButton extends StatelessWidget {
  const MultipassButton({
    Key key,
  }) : super(key: key);

  static int mode = 0;
  static int options = 3;
  static void bump() {
    mode = (mode < options ? mode + 1 : 0);
    multipassStream.add(mode);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        initialData: 0,
        stream: multipassStream.stream,
        builder: (context, snapshot) {
          mode = snapshot.data;
          return _doButton(context);
        });
  }

  Widget _doButton(BuildContext context) {
    if (mode == 0)
      return TagPhotosButton();
    else if (mode == 1)
      return SearchTagsButton();
    else if (mode == 2)
      return SharePhotosButton();
    else
      return VoiceSearchButton();
  }
}

class MultipassModeButton extends StatelessWidget {
  const MultipassModeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.modx,
      title: "Mode",
      onTap: () => MultipassButton.bump(),
    );
  }
}
