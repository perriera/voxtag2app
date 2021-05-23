import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/tag_text.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';

class ShadowedTag extends StatelessWidget {
  final VoxTag photoId;
  final TextStyle textStyle;
  final String tag;
  const ShadowedTag({
    Key key,
    this.photoId,
    this.textStyle,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(50, 50, 10, 120),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TagText(photoId: photoId, textStyle: textStyle, tag: tag)
          ],
        ));
  }
}
