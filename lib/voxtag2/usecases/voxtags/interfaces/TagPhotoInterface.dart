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

import 'VoxTagInterface.dart';

abstract class TagPhotoInterface {
  //
  // individual TagPhotoInterface methods
  //
  void tag(VoxTagInterface photoId, String tags);
  bool isTagged(VoxTagInterface photoId);
  String tags(VoxTagInterface photoId);
  List<String> tagsList(VoxTagInterface photoId);
  void remove(VoxTagInterface photoId, String tag);
  void unTag(VoxTagInterface photoId);
  void append(VoxTagInterface photoId, String tags);
  void removeAll();

  //
  // group TagPhotoInterface methods
  //
  List<VoxTagInterface> allTaggedPhotos();
  List<VoxTagInterface> searchTags(String tags, bool andOr);
  List<String> allTags();
  int get totalNumberOfTags;
  bool get hasTags;
}
