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
