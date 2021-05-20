// import 'package:voxtag2app/obsolete/voxtag2/options/options.dart';
// import 'package:voxtag2app/obsolete/voxtag2/options/reserved_words.dart';

import 'package:voxtag2app/voxtag2/extensions/ReservedWords.dart';

extension CapExtension on String {
  static int smallestWord = 3;

  String get inCaps {
    var capped = '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
    return capped;
  }

  String get allInCaps => this.toUpperCase();

  String get allWordsInCaps {
    var parts = this.split(" ");
    String result = "";
    for (String part in parts) {
      if (part.length != 0) {
        var formattedWord = part.inCaps;
        result = result + " " + formattedWord;
      }
    }
    return result;
  }

  String get filteredForVoxTag {
    String result = this.allWordsInCaps;
    result = result.noDuplicates;
    result = result.noSmallwords;
    result = result.noLargeWords;
    result = result.doMaxLenght;
    result = result.sorted;
    result = result.noReservedwords;
    result = result.trim();
    return result;
  }

  String get noSmallwords {
    var parts = this.split(" ");
    List<String> words = [];
    for (String part in parts) {
      if (part.trim().length > smallestWord) {
        if (!words.contains(part)) words.add(part);
      }
    }
    String result = "";
    for (String part in words) {
      result = result + part + " ";
    }
    result = result.trim();
    return result;
  }

  String get noReservedwords {
    var reservedWords = ReservedWords.currentList;
    List<String> parts = [];
    if (this != null) parts = this.toLowerCase().split(" ");
    List<String> words = [];
    for (String word in parts) {
      if (word.trim().length > 0) {
        if (!reservedWords.contains(word)) words.add(word);
      }
    }
    String result = "";
    for (String part in words) {
      result = result + part + " ";
    }
    result = result.trim();
    return result;
  }

  String get sorted {
    var words = this.split(" ");
    words.sort();
    String result = "";
    for (String word in words) {
      if (word.length > 0) result = result + word + " ";
    }
    result = result.trim();
    return result;
  }

  String get noLargeWords {
    var parts = this.split(" ");
    List<String> words = [];
    for (String part in parts) {
      if (part.trim().length < 14) {
        if (!words.contains(part)) words.add(part);
      }
    }
    String result = "";
    for (String part in words) {
      result = result + part + " ";
    }
    result = result.trim();
    return result;
  }

  String get doMaxLenght {
    var parts = this.split(" ");
    List<String> words = [];
    for (String part in parts) {
      if (part.trim().length > smallestWord) {
        if (!words.contains(part)) words.add(part);
      }
    }
    String result = "";
    for (String part in words) {
      result = result + part + " ";
      if (result.length > 100) break;
    }
    result = result.trim();
    return result;
  }

  String get noDuplicates {
    var parts = this.split(" ");
    List<String> unique = [];
    for (String part in parts) {
      if (part.trim().length != 0) {
        if (!unique.contains(part)) unique.add(part);
      }
    }
    String result = "";
    for (String part in unique) {
      result = result + part + " ";
    }
    result = result.trim();
    return result;
  }

  static final RegExp nameAndNumnberRegExp = RegExp('[a-zA-Z0-9]');

  String get allWordsAndNumnbersCaps {
    var parts = this.split(" ");
    String result = "";
    for (String part in parts) {
      if (part.length != 0) {
        var formattedWord = part.inCaps;
        if (CapExtension.nameAndNumnberRegExp.hasMatch(formattedWord))
          result = result + " " + formattedWord;
      }
    }
    result = result.trim();
    return result;
  }

  String get lastWord {
    var parts = this.split(" ");
    if (parts.length == 0) return "";
    String lastWord = parts[parts.length - 1];
    return lastWord;
  }

  bool containsWord(String tags, bool searchLogic) {
    String tagValue = this;
    int matchCnt = 0;
    var parts1 = tagValue.toLowerCase().split(" ");
    var parts2 = tags.toLowerCase().split(" ");
    for (String part1 in parts1) {
      for (String part2 in parts2) {
        if (part1 == part2) {
          if (!searchLogic)
            return true;
          else if (++matchCnt == parts2.length) return true;
        }
      }
    }
    return false;
  }

  String replaceWord(String oldTag, String newTag) {
    String tagValue = this;
    oldTag = oldTag.toLowerCase();
    newTag = newTag.toLowerCase();
    tagValue = tagValue.replaceAll(oldTag, newTag);
    return tagValue;
  }
}
