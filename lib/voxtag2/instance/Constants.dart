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


import 'dart:io' show Platform;
import 'package:flutter/material.dart';

const kAppTitle = 'VoxTag 2';
const kBottomContainerHeight = 40.0;

// ignore: camel_case_types
class Constants {
  static const double padding = 20;
  static const double avatarRadius = 45;

  static String appName() {
    return kAppTitle;
  }

  static String appTitle() {
    if (Platform.isIOS) {
      return appName() + ' for iOS';
    }
    if (Platform.isAndroid) {
      return appName() + ' for Android';
    }
    return appName();
  }

  static String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  static bool isPad() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    var size = data.size.shortestSide;
    return size > 600;
  }

  static int gridSize() {
    return isPad() ? 6 : 4;
  }
}
