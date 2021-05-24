import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search/search_tags_menuitem.dart';
import 'change/change_columns_button.dart';
import 'change/change_tag_menuitem.dart';
import 'delete/delete_tag_menuitem.dart';

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
