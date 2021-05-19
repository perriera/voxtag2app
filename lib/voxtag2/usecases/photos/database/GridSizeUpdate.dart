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
