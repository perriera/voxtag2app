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


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

StreamController<int> themeSelection = StreamController();

class ThemeStyle {
  final String kThemeName;
  final String kWholeRealm;
  final Color kMainColor;
  final Color kNavBarColor;
  final Color kIconColor;
  final Color kHighlightColor;
  final TextStyle kNavBarTextStyle;
  final TextStyle kAppBarTextStyle;
  final TextStyle kTextFieldStyle;
  final TextStyle kErrorTextStyle;
  final TextStyle kTagLabelTextStyle;
  final TextStyle kDialogTitleStyle;
  final TextStyle kOptionsItemStyle;

  ThemeStyle({
    this.kThemeName,
    this.kWholeRealm,
    this.kMainColor,
    this.kNavBarColor,
    this.kIconColor,
    this.kHighlightColor,
    this.kNavBarTextStyle,
    this.kAppBarTextStyle,
    this.kTextFieldStyle,
    this.kErrorTextStyle,
    this.kTagLabelTextStyle,
    this.kDialogTitleStyle,
    this.kOptionsItemStyle,
  });
}

class ThemeCatalog {
  static var _kBodyTextStyle = 14.0;
  static var _themeId = 0;
  static var kWholeRealmWhite = 'images/logos/WRT_logo-white.png';
  static var kWholeRealmBlack = 'images/logos/WRT_logo-t-b.png';
  static get kThemeName => styleSheets[_themeId].kThemeName;
  static get kWholeRealm => styleSheets[_themeId].kWholeRealm;
  static get kMainColor => styleSheets[_themeId].kMainColor;
  static get kNavBarColor => styleSheets[_themeId].kNavBarColor;
  static get kIconColor => styleSheets[_themeId].kIconColor;
  static get kHighlightColor => styleSheets[_themeId].kHighlightColor;
  static get kAppBarTextStyle => styleSheets[_themeId].kAppBarTextStyle;
  static get kNavBarTextStyle => styleSheets[_themeId].kNavBarTextStyle;
  static get kTextFieldStyle => styleSheets[_themeId].kTextFieldStyle;
  static get kErrorTextStyle => styleSheets[_themeId].kErrorTextStyle;
  static get kTagLabelTextStyle => styleSheets[_themeId].kTagLabelTextStyle;
  static get kDialogTitleStyle => styleSheets[_themeId].kDialogTitleStyle;
  static get kOptionsItemStyle => styleSheets[_themeId].kOptionsItemStyle;
  static get isStatusBarWhiteForeground =>
      styleSheets[_themeId].kIconColor == Colors.white;

  static double widthOfScreen(BuildContext context) {
    // full screen width and height
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  static double heightOfScreen(BuildContext context) {
    // full screen width and height
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  static List<ThemeStyle> styleSheets = [
    ThemeStyle(
      kThemeName: 'Default',
      kWholeRealm: kWholeRealmWhite,
      kMainColor: Color(0xFF0B0B18),
      kNavBarColor: Color(0xFF111328),
      kIconColor: Colors.white,
      kHighlightColor: Colors.lightBlue[900],
      kNavBarTextStyle: TextStyle(
        fontSize: 11.0,
        color: Color(0xFF8D8E98),
      ),
      kAppBarTextStyle: TextStyle(
        fontSize: 18.0,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
        color: Color(0xFF8D8E98),
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Color(0xFF8D8E98),
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Color(0xFF8D8E98),
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
    ThemeStyle(
      kThemeName: 'Cyan',
      kWholeRealm: kWholeRealmBlack,
      kMainColor: Colors.cyanAccent[700],
      kNavBarColor: Colors.cyanAccent[100],
      kIconColor: Colors.black54,
      kHighlightColor: Colors.lightBlue[900],
      kAppBarTextStyle: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      kNavBarTextStyle: TextStyle(
        fontFamily: 'Raleway',
        fontSize: 11.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Colors.black,
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.cyanAccent[400],
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
        color: Colors.white,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.cyanAccent,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
    ThemeStyle(
      kThemeName: 'Orange',
      kWholeRealm: kWholeRealmWhite,
      kMainColor: Colors.deepOrange[300],
      kNavBarColor: Colors.deepOrange[700],
      kIconColor: Colors.white,
      kHighlightColor: Colors.lightBlue[900],
      kNavBarTextStyle: TextStyle(
        fontSize: 11.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kAppBarTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Colors.deepOrange[300],
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.deepOrange[400],
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
        color: Colors.white,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.deepOrange[300],
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
    ThemeStyle(
      kThemeName: 'Amber',
      kWholeRealm: kWholeRealmBlack,
      kMainColor: Colors.amberAccent[200],
      kNavBarColor: Colors.amberAccent[700],
      kIconColor: Colors.black54,
      kHighlightColor: Colors.lightBlue[900],
      kAppBarTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.black54,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kNavBarTextStyle: TextStyle(
        fontSize: 11.0,
        color: Colors.black54,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Colors.black,
        fontFamily: 'Raleway',
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.black54,
        fontFamily: 'Raleway',
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
        color: Colors.black,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.amberAccent,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
    ThemeStyle(
      kThemeName: 'Blue',
      kWholeRealm: kWholeRealmWhite,
      kMainColor: Colors.blueAccent[700],
      kNavBarColor: Colors.blueAccent[200],
      kIconColor: Colors.white,
      kHighlightColor: Colors.lightBlue[900],
      kNavBarTextStyle: TextStyle(
        fontSize: 11.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kAppBarTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Colors.black54,
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.blueAccent[400],
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
        color: Colors.white,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
    ThemeStyle(
      kThemeName: 'Green',
      kWholeRealm: kWholeRealmWhite,
      kMainColor: Colors.greenAccent[400],
      kNavBarColor: Colors.greenAccent[700],
      kIconColor: Colors.white,
      kHighlightColor: Colors.lightBlue[900],
      kAppBarTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kNavBarTextStyle: TextStyle(
        fontSize: 11.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Colors.black54,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
        color: Colors.white,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.lightGreenAccent,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
    ThemeStyle(
      kThemeName: 'Indigo',
      kWholeRealm: kWholeRealmWhite,
      kMainColor: Colors.indigoAccent[200],
      kNavBarColor: Colors.indigoAccent[700],
      kIconColor: Colors.white,
      kHighlightColor: Colors.lightBlue[900],
      kAppBarTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kNavBarTextStyle: TextStyle(
        fontSize: 11.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Colors.black87,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.indigoAccent[400],
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.indigoAccent,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
    ThemeStyle(
      kThemeName: 'Purple',
      kWholeRealm: kWholeRealmWhite,
      kMainColor: Colors.deepPurple[700],
      kNavBarColor: Colors.deepPurple[600],
      kIconColor: Colors.white,
      kHighlightColor: Colors.lightBlue[900],
      kNavBarTextStyle: TextStyle(
        fontSize: 11.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kAppBarTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTextFieldStyle: TextStyle(
        fontSize: 28.0,
        color: Colors.black87,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kErrorTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.deepPurple[400],
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kTagLabelTextStyle: TextStyle(
        fontSize: _kBodyTextStyle,
        color: Colors.white,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kDialogTitleStyle: TextStyle(
        color: Colors.lightBlueAccent,
        fontSize: 25,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
      kOptionsItemStyle: TextStyle(
        color: Colors.purpleAccent,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.bold,
      ),
    ),
  ];

  static int current = 0;
  static int bump() {
    current = current + 1;
    current = current % styleSheets.length;
    themeSelection.add(current);
    return current;
  }

  static void setStyleSheet(int theme) {
    if (theme < styleSheets.length)
      _themeId = theme;
    else
      throw "Out of bounds _themdId";
  }

  static ThemeData select(BuildContext context, int theme) {
    setStyleSheet(theme);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        isStatusBarWhiteForeground);
    switch (theme) {
      case 0:
        return ThemeData.dark().copyWith(
            primaryColor: kNavBarColor,
            accentColor: Colors.purple,
            sliderTheme: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0)));
      case 1:
        return ThemeData.dark().copyWith(
            primaryColor: kNavBarColor,
            accentColor: Colors.purple,
            sliderTheme: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                overlayColor: Colors.amber,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0)));
      default:
        return ThemeData.dark().copyWith(
            primaryColor: kNavBarColor,
            accentColor: Colors.purple,
            sliderTheme: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0)));
    }
  }
}
