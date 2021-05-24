import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/app_bar.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/obsolete/tags_grid.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/search/search_tags_actions.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/search/search_tags_navbr.dart';

import '../obsolete/TagUpdateModeInterface.dart';

class TagsSearchLayout extends StatelessWidget {
  TagsSearchLayout() {
    tagActionMode.add(SearchTagsAction());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(),
      body: Center(
        child: TagsGrid(),
      ),
      bottomNavigationBar: TagsNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }
}
