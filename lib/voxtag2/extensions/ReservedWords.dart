import 'dart:io';

// import '../../../obsolete/voxtag1/voxtags/database.dart';
// import 'filters.dart';
import 'CapExtensions.dart';

class ReservedWords {
  static String _currentList;
  static String __localPath;
  static String defaultList = "the with at so";

  static String get currentList {
    return _currentList == null ? "" : _currentList;
  }

  static List<String> get currentWords {
    List<String> updatedList = [];
    for (String word in currentList.split(" ")) {
      if (word.length > 0) updatedList.add(word);
    }
    return updatedList;
  }

  ReservedWords() {
    _read();
  }

  Future<String> get _localPath async {
    final directory = __localPath;
    return directory;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/ReservedWords.txt");
  }

  Future<File> write(String words) async {
    final file = await _localFile;
    _currentList = words.toLowerCase().noDuplicates.noLargeWords.noSmallwords;
    return file.writeAsString('$words');
  }

  Future<File> append(String newWords) async {
    String oldList = await _read();
    String newList = newWords + " " + oldList;
    newList = newList.sorted;
    return write(newList);
  }

  Future<File> remove(String badWord) async {
    List<String> oldList = await _list();
    String newList = "";
    for (String word in oldList) {
      if (word != badWord) newList = newList + "  " + word;
    }
    newList = newList.trim();
    return write(newList);
  }

  Future<File> set(String newWords) async {
    String newList = newWords;
    newList = newList.sorted.toLowerCase();
    return write(newList);
  }

  Future<String> _read() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      _currentList = contents.toLowerCase();
      if (currentList.length == 0) _currentList = defaultList;
      print('ReservedWords loaded');
    } catch (e) {
      _currentList = defaultList;
      print('ReservedWords defaulted');
    }
    _currentList =
        _currentList.toLowerCase().noDuplicates.noLargeWords.noSmallwords;
    return currentList;
  }

  Future<List<String>> _list() async {
    String words = await _read();
    if (words.length > 0) {
      List<String> split = words.trim().split(" ");
      List<String> list = [];
      for (String word in split) {
        if (word.length > 0) list.add(word);
      }
      return list;
    } else
      return List<String>();
  }
}
