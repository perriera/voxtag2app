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
