///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// THE SOFTWARE IS  PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
/// EXPRESSED  OR   IMPLIED,  INCLUDING   BUT  NOT  LIMITED  TO  THE
/// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A  PARTICULAR PURPOSE
/// AND NON-INFRINGEMENT.  IN  NO  EVENT  SHALL EXPARX  INCORPORATED
/// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER  IN
/// AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  FROM, OUT  OF
/// OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR  OTHER DEALINGS
/// IN THE SOFTWARE.
///
/// (See LICENSE.md for complete details)
///


import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/extensions/ReservedWords.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';

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

  static fontFactorSize(BuildContext context, String word, bool display) {
    var width = ThemeCatalog.widthOfScreen(context);
    var lenght = word.length;
    double fontSizeFactor = 16.0;
    double reduceFactor = 10.0;
    if (lenght > 7) {
      fontSizeFactor = 15.0;
      reduceFactor = 6.0;
    }
    if (width < 400) {
      fontSizeFactor -= 2;
    }
    int reduceByAnExtra = lenght - 7;
    if (reduceByAnExtra > 0) {
      double percentage = (100 - (reduceFactor * reduceByAnExtra)) / 100;
      fontSizeFactor = fontSizeFactor * percentage;
//      print(fontSizeFactor);
    }
    if (display) fontSizeFactor = fontSizeFactor * 2;
    return fontSizeFactor;
  }
}
