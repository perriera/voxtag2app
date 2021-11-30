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


import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'GridSizeInterface.dart';

class GridSizeUpdate implements GridSizeInterface {
  static int _bump = 4;
  static GridSizeUpdate bump() {
    _bump = _bump + 1;
    _bump = _bump % 3;
    return GridSizeUpdate(_bump + 2);
  }

  static void refresh() {
    _bump = _bump % 3;
    gridSizeUpdate.add(GridSizeUpdate(_bump + 2));
  }

  final int columns;
  GridSizeUpdate(this.columns);
  @override
  int get size => columns;
}

///
/// GridSizeInterface StreamController
///
StreamController<GridSizeInterface> gridSizeUpdate = BehaviorSubject();
