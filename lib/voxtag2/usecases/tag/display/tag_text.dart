import 'package:flutter/cupertino.dart';

import '../../../extensions/CapExtensions.dart';

class TagText extends StatelessWidget {
  final TextStyle textStyle;
  final String tag;
  const TagText({
    Key key,
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
