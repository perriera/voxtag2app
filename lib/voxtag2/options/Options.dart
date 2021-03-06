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


import 'package:flutter_is_emulator/flutter_is_emulator.dart';

class Options {
  static bool displayTags = true;
  static bool searchANDOR = false;
  static int smallestWord = 3;

  static Future<bool> _checkDevice() async {
    try {
      bool res = await FlutterIsEmulator.isDeviceAnEmulatorOrASimulator;
      var text = res.toString();
      var isEmulator = (text == "true");
      return isEmulator;
    } catch (error) {
      print(error);
      return false;
    }
  }

  static Future<bool> get deviceIsEmulator async {
    var isEmulator = await _checkDevice();
    return isEmulator;
  }
}
