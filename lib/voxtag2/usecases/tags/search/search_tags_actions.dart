import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/PageNavigator.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/access/view_photos.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotosUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

import 'TagUpdateModeInterface.dart';

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
    PageNavigator(context, PhotosView(context)).jump();
  }
}
