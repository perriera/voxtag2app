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
