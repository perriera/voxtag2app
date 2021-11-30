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

import 'dart:convert';

import 'package:crclib/catalog.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

class VoxTag implements VoxTagInterface {
  final AlbumModelEntity entity;
  VoxTag({this.entity}) {
    var x = this.entity.localIdentifier;
    var value = Crc32Xz().convert(utf8.encode(x));
    this.id = value.hashCode;
  }

  @override
  int id;

  @override
  String get thumbPath => entity.thumbPath;
}
