import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/options/Options.dart';

import '../display/tag_widget.dart';

class TagSelectWidget extends TagWidgetBase {
  const TagSelectWidget({
    Key key,
    @required this.tag,
    @required this.onSelect,
    this.deleteMode = false,
  }) : super(key: key);

  final String tag;
  final Function onSelect;
  final bool deleteMode;

  String getTag() {
    return tag;
  }

  @override
  Widget build(BuildContext context) {
    print(Options.displayTags ? tag : "nope");
    return GestureDetector(
      onTap: () {
        onSelect(tag);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(50, 50, 10, 120),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            deleteMode
                ? Row(
                    children: <Widget>[
                      Container(
                        child: Icon(FontAwesomeIcons.check),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  )
                : Container(),
            // StreamBuilder<PhotoAlbumUpdate>(
            //     stream: photoAlbum.stream,
            //     builder: (context, snapshot) {
            //       return Text(
            //         Options.displayTags ? tag : "",
            //         style: ThemeCatalog.kTagLabelTextStyle.copyWith(
            //             fontSize:
            //                 CapExtension.fontFactorSize(context, tag, true)),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
