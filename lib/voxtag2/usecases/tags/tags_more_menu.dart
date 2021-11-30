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

import '../columns/change/change_columns_button.dart';
import '../tag/change/change_tag_menuitem.dart';
import '../tag/delete/delete_tag_menuitem.dart';
import 'search/search_tags_menuitem.dart';

class TagsMoreMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView(
        children: <Widget>[
          ChangeColumnsButton(),
          SearchTagsMenuItem(),
          ChangeTagMenuItem(),
          DeleteTagMenuItem(),
        ],
      ),
    );
  }
}
