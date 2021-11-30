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
import 'package:voxtag2app/voxtag2/extensions/CenterIt.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/tag/display/shadow_tag.dart';

import '../../../extensions/CapExtensions.dart';

class DeleteTagDialog extends StatefulWidget {
  final Function update;
  final String tagToDelete;

  DeleteTagDialog({Key key, this.update, this.tagToDelete}) : super(key: key);

  @override
  _DeleteTagDialogState createState() => _DeleteTagDialogState();
}

class _DeleteTagDialogState extends State<DeleteTagDialog> {
  var diagnostic = "";
  final myController = EndOfTextController();

  bool validateInput(String before) {
    var after = before.allWordsAndNumnbersCaps;
    return after.length > 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeCatalog.kMainColor,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: ThemeCatalog.kNavBarColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular((20)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Delete Tag',
              textAlign: TextAlign.center,
              style: ThemeCatalog.kDialogTitleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            CenterIt(
                widget: Text(
              widget.tagToDelete,
              style: ThemeCatalog.kTextFieldStyle.copyWith(
                fontSize: 40.0,
              ),
            )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                doYesButton(context),
                SizedBox(
                  width: 20,
                ),
                doNoButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton doYesButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'Yes'),
      onPressed: () {
        Navigator.pop(context);
        widget.update(widget.tagToDelete, true);
      },
    );
  }

  TextButton doNoButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'No'),
      onPressed: () {
        Navigator.pop(context);
        widget.update(widget.tagToDelete, false);
      },
    );
  }
}

class EndOfTextController extends TextEditingController {
  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
      composing: TextRange.empty,
    );
  }
}
