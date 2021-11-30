///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// Permission is hereby  granted,  free of charge,  to  any  person
/// obtaining a copy of this software and  associated  documentation
/// files   (the  "Software"),  to deal  in   the  Software  without
/// restriction, including  without  limitation the rights  to  use,
/// copy,  modify, merge,  publish,  distribute,  sublicense, and/or
/// sell copies of the  Software, and to permit persons  to whom the
/// Software  is  furnished to  do  so,  subject  to  the  following
/// conditions:
///
/// (See LICENSE.md for complete details)
///

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
