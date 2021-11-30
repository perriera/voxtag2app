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

import 'search_tags_usecase.dart';
// import 'package:voxtag2app/voxtag3/app/themes.dart';
// import 'package:voxtag2app/voxtag3/views/tags/usecases/search_tags/search_tags_usecase.dart';

class SearchTagsMenuItem extends StatelessWidget {
  const SearchTagsMenuItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(FontAwesomeIcons.search),
        title: Text(
          "Search Tag (default)",
          style: ThemeCatalog.kOptionsItemStyle,
        ),
      ),
      onTap: () => SearchTagsUseCase(context),
    );
  }
}
