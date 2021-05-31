import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';

import '../../../extensions/CapExtensions.dart';

class TagText extends StatelessWidget {
  final VoxTag photoId;
  final TextStyle textStyle;
  final String tag;
  const TagText({
    Key key,
    this.photoId,
    this.textStyle,
    this.tag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      tag.allWordsInCaps,
      style: textStyle,
    );
  }
}
