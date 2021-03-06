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
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/tag/display/shadow_tag.dart';

import '../../../extensions/CapExtensions.dart';

class ChangeTagDialog2 extends StatefulWidget {
  final Function update;
  final String tagToChange;

  ChangeTagDialog2({Key key, this.update, this.tagToChange}) : super(key: key);

  @override
  _ChangeTagDialog2State createState() => _ChangeTagDialog2State();
}

class _ChangeTagDialog2State extends State<ChangeTagDialog2> {
  var diagnostic = "";
  final myController = EndOfTextController();
  String newTags = "";

  bool validateInput(String before) {
    var after = before.allWordsAndNumnbersCaps;
    return after.length > 0;
  }

  @override
  void initState() {
    super.initState();
    newTags = widget.tagToChange;
    myController.text = newTags;
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
              'Rerecord Tag',
              textAlign: TextAlign.center,
              style: ThemeCatalog.kDialogTitleStyle,
            ),
            TextField(
              controller: myController,
              autofocus: true,
              textAlign: TextAlign.center,
              style: ThemeCatalog.kTextFieldStyle,
              onChanged: (value) {
                if (diagnostic.length > 0) {
                  setState(() {
                    diagnostic = "";
                  });
                }
                newTags = value;
              }, //
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                doConfirmButton(context),
                SizedBox(
                  width: 20,
                ),
                doAbortButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextButton doConfirmButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'Change'),
      onPressed: () {
        newTags = myController.text;
        if (validateInput(newTags)) {
          Navigator.pop(context);
          widget.update(newTags, true);
        } else {
          setState(() {
            widget.update(newTags, true);
          });
        }
      },
    );
  }

  TextButton doAbortButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'Undo'),
      onPressed: () {
        Navigator.pop(context);
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
