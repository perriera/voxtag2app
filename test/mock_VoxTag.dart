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

// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

class VoxTag implements VoxTagInterface {
  final String path;
  VoxTag({this.path}) {
    this.id = path.hashCode;
  }
  @override
  int id;
  @override
  String get thumbPath => path;
}
