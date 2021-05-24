import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
// import 'package:voxtag2app/voxtag3/app/themes.dart';

// import '../../../../app/extensions/string.dart';
import '../../../extensions/CapExtensions.dart';

class TagPhotosDialog extends StatefulWidget {
  final Function update;

  TagPhotosDialog({Key key, this.update}) : super(key: key);

  @override
  _TagPhotosDialogState createState() => _TagPhotosDialogState();
}

class _TagPhotosDialogState extends State<TagPhotosDialog> {
  var diagnostic = "";
  final myController = EndOfTextController();
  String newTags = "";

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
              'Record Tag',
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
                doReplaceButton(context),
                SizedBox(
                  width: 20,
                ),
                doAppendButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FlatButton doAppendButton(BuildContext context) {
    return FlatButton(
      child: Text(
        'Append Tags',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.lightBlueAccent,
      onPressed: () {
        if (validateInput(newTags)) {
          Navigator.pop(context);
          widget.update(newTags, true);
        } else {
          setState(() {
            newTags = "";
            myController.text = "";
            diagnostic = "Letters and numbers only";
          });
        }
      },
    );
  }

  FlatButton doReplaceButton(BuildContext context) {
    return FlatButton(
      child: Text(
        'Replace Tags',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.lightBlueAccent,
      onPressed: () {
        if (validateInput(newTags)) {
          Navigator.pop(context);
          widget.update(newTags, false);
        } else {
          setState(() {
            newTags = "";
            myController.text = "";
            diagnostic = "Letters and numbers only";
          });
        }
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
