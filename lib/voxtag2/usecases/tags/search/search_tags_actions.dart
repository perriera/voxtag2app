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
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/usecases/main/display/main_display.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotosUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import '../../tag/TagUpdateModeInterface.dart';

/// TagsEditModeSearch
/// When a displayed tag is clicked a tag search on the
/// tagged photos is performmed
///
class SearchTagsAction implements TagUpdateModeInterface {
  @override
  String get title => "Search";
  @override
  IconData get icon => FontAwesomeIcons.search;
  @override
  void onTap(BuildContext context, String tag) {
    var results = VoxTags().instance.searchTags(tag, false);
    PhotosUpdate selected = PhotosUpdate(results);
    getDescAlbumImg.add(selected);
    PageNavigator(context, MainDisplay()).jump();
  }
}
