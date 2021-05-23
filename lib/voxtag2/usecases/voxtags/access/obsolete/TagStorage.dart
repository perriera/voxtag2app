import 'dart:convert';
import 'dart:io';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class TagsStorage {
  final String filename;
  static String applicationDocumentsDirectory;

  TagsStorage({this.filename});

  static void init(String applicationPath) {
    applicationDocumentsDirectory = applicationPath;
  }

  Future<File> _getLocalFile(String filename) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File f = new File('$dir/$filename');
    return f;
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
