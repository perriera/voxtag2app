import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PhotoSpinner extends StatefulWidget {
  @override
  _PhotoSpinnerState createState() => _PhotoSpinnerState();
}

class _PhotoSpinnerState extends State<PhotoSpinner>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SpinKitFadingGrid(
          color: Colors.blueGrey,
          size: 20.0,
          controller: AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 1200),
          ),
        ),
      ),
    );
  }
}
