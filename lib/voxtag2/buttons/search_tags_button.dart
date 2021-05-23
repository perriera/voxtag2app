import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';

class SearchTagsButton extends StatelessWidget {
  const SearchTagsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavBarButton(
      icon: FontAwesomeIcons.redo,
      title: "Search",
      onTap: () {
        PhotosAlbum().access(context);
      }, // RefreshPhotoUseCase(context),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:voxtag2app/obsolete/voxtag2/widgets/navbar_button.dart';
// import 'package:voxtag2app/voxtag3/app/extensions/Page_navigator.dart';
// import 'package:voxtag2app/voxtag3/views/tags/usecases/display_tags/tags_layout.dart';

// class SearchButton extends StatelessWidget {
//   const SearchButton({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NavBarButton(
//         icon: FontAwesomeIcons.search,
//         title: 'Search',
//         onTap: () {
//           PageNavigator(context, TagsSearchLayout()).jump();
//         });
//   }
// }
