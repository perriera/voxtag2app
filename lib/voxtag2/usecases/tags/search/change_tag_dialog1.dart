import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/extensions/CenterIt.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import '../../../extensions/CapExtensions.dart';

class ChangeTagDialog1 extends StatefulWidget {
  final Function update;
  final String tagToDelete;

  ChangeTagDialog1({Key key, this.update, this.tagToDelete}) : super(key: key);

  @override
  _ChangeTagDialog1State createState() => _ChangeTagDialog1State();
}

class _ChangeTagDialog1State extends State<ChangeTagDialog1> {
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
              'Change Tag',
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

  FlatButton doYesButton(BuildContext context) {
    return FlatButton(
      child: Text(
        'Yes',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.lightBlueAccent,
      onPressed: () {
        Navigator.pop(context);
        widget.update(widget.tagToDelete, true);
      },
    );
  }

  FlatButton doNoButton(BuildContext context) {
    return FlatButton(
      child: Text(
        'No',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.lightBlueAccent,
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
