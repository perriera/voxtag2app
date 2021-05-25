import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/app/display_maindisplay/app_bar.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/streams/photo_stream.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/shadow_tag.dart';
import 'package:voxtag2app/voxtag2/usecases/tag/remove/remove_tag_navbar.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

class RemoveTagDialog extends StatefulWidget {
  final VoxTag voxTag;

  const RemoveTagDialog({Key key, this.voxTag}) : super(key: key);
  @override
  _RemoveTagDialogState createState() => _RemoveTagDialogState();
}

class _RemoveTagDialogState extends State<RemoveTagDialog> {
  List<String> events = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = convert(widget.voxTag);
    if (widgets.length == 0) Navigator.pop(context);
    return Scaffold(
      appBar: AppTopBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: convert(widget.voxTag),
              )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: RemoveTagNavBar(),
      backgroundColor: ThemeCatalog.kMainColor,
    );
  }

  List<Widget> convert(VoxTag photoId) {
    List<String> tags = VoxTags().instance.tagsList(photoId);
    List<Widget> result = [];
    for (String tag in tags) result.add(addLine(tag, photoId));
    return result;
  }

  Widget addLine(String text, VoxTag voxTag) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 30),
                Icon(FontAwesomeIcons.minusCircle),
                SizedBox(width: 10),
                ShadowedTag(
                  photoId: voxTag,
                  tag: text,
                  textStyle: ThemeCatalog.kOptionsItemStyle.copyWith(
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      onTap: () {
        VoxTags().instance.remove(voxTag, text);
        VoxTags().instance.save();
        setState(() {});
        PhotoStream.refresh();
      },
    );
  }
}
