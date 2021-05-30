import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:voxtag2app/voxtag2/instance/VoxTag2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    runApp(VoxTag2());
  } catch (error) {
    Fluttertoast.showToast(msg: error.toString());
    print(error);
  }
}
