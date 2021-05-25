import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastDialog {
  final BuildContext context;
  // Fluttertoast flutterToast;

  ToastDialog(this.context) {
    // flutterToast = Fluttertoast(context);
  }

  void display(String msg, bool error) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      margin: const EdgeInsets.only(bottom: 64.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color:
            error ? Colors.red : Colors.green, // ThemeCatalog.kBottomCardColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(msg),
        ],
      ),
    );

    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_SHORT, timeInSecForIosWeb: 1);

    //   child: toast,
    //   gravity: ToastGravity.BOTTOM,
    //   toastDuration: Duration(seconds: 2),
    // );
  }
}
