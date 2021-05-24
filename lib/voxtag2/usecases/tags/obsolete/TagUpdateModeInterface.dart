import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

///
/// TagActionModeInterface
///
abstract class TagUpdateModeInterface {
  String get title;
  IconData get icon;
  void onTap(BuildContext context, String tag);
}

///
/// TagActionModeInterface StreamController
///
StreamController<TagUpdateModeInterface> tagActionMode = BehaviorSubject();
