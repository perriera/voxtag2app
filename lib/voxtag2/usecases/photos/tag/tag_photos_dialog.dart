import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/tag/display/shadow_tag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';
import 'dart:ui' as ui;

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
              'Tag Photos',
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
                doCancelButton(context),
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

  TextButton doReplaceButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'Replace'),
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

  TextButton doCancelButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'Cancel'),
      onPressed: () {
        VoxTags().instance.clearSelected();
        PhotosAlbum().refresh(context);
        Navigator.pop(context);
      },
    );
  }

  TextButton doAppendButton(BuildContext context) {
    return TextButton(
      child: ShadowedButton(tag: 'Append'),
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
}

class ActionButton extends StatelessWidget {
  final String text;
  const ActionButton({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.white);
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 2.0,
            left: 2.0,
            child: new Text(
              this.text,
              style: style.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: new Text(this.text, style: style),
          ),
        ],
      ),
    );
  }
}

// style: TextStyle(color: Colors.white)

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
