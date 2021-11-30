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
import 'dart:io';

class TagsStorage {
  final String filename;
  static String applicationDocumentsDirectory;

  TagsStorage({this.filename});

  static void init(String applicationPath) {
    applicationDocumentsDirectory = applicationPath;
  }

  String get localPathname {
    var msg = '$applicationDocumentsDirectory/$filename.json';
    return msg;
  }

  Map<String, String> wrap(
    Map<int, String> unWrapped,
  ) {
    Map<String, String> wrapped = Map<String, String>();
    unWrapped.forEach((crc, tag) {
      var key = crc.toString();
      wrapped[key] = tag;
    });
    return wrapped;
  }

  Map<int, String> unwrap(
    Map<String, dynamic> wrapped,
  ) {
    Map<int, String> unwrapped = Map<int, String>();
    wrapped.forEach((key, tag) {
      var crc = int.parse(key);
      unwrapped[crc] = tag;
    });
    return unwrapped;
  }

  void save({Map<int, String> voxTags}) {
    final file = File(localPathname);
    var wrapped = wrap(voxTags);
    file.createSync();
    file.writeAsStringSync(json.encode(wrapped));
  }

  Map<int, String> load() {
    Map<int, String> voxTags = Map<int, String>();
    final file = File(localPathname);
    bool fileExists = file.existsSync();
    if (fileExists) {
      String wtf = file.readAsStringSync();
      Map<String, dynamic> wrapped = json.decode(wtf);
      var unwrapped = unwrap(wrapped);
      voxTags = unwrapped;
    }
    return voxTags;
  }
}
