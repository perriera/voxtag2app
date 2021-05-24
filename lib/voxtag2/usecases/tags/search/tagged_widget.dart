import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tags_widget.dart';

class TaggedWidget extends StatelessWidget {
  final Function onTap;
  const TaggedWidget({
    Key key,
    @required this.tag,
    this.onTap,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      autofocus: true,
      onPressed: this.onTap,
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: TagsWidget(
          tag: tag,
          horizontal: false,
        )),
      ),
    );
  }
}
