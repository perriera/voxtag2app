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
