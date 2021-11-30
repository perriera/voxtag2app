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

abstract class SelectPhotoInterface {
  //
  // individual SelectPhotoInterface methods
  //
  void select(VoxTagInterface photoId);
  void unSelect(VoxTagInterface photoId);
  bool isSelected(VoxTagInterface photoId);
  void toggleSelect(VoxTagInterface photoId);
  bool anySelected();

  //
  // group SelectPhotoInterface methods
  //
  List<VoxTagInterface> allSelectedPhotos();
  void tagSelected(String tags, bool append);
  void clearSelected();
  void selectAll();
  void unSelectAll();
  void toggleSelectAll();
}
