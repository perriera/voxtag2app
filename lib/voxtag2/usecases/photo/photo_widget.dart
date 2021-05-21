import 'package:flutter/cupertino.dart';
// import 'package:photo_view/photo_view.dart' as pv;
import 'package:voxtag2app/voxtag2/instance/Themes.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/photo_stream.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/VoxTag.dart';
// import 'package:voxtag2app/voxtag3/app/themes.dart';
// import 'package:voxtag2app/voxtag3/models/voxtag.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/display_photo/photo_stream.dart';
// import 'package:voxtag2app/voxtag3/views/photos/usecases/display_photo_tags/photo_tags.dart';

class PhotoWidget extends StatelessWidget {
  final FileImage fileImage;
  final VoxTag photoId;

  const PhotoWidget({
    Key key,
    this.fileImage,
    this.photoId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<Object>(
    //     stream: photoAction.stream,
    //     builder: (context, snapshot) {
    return Column(
      children: [
        Text("Jesus Christ"),
        // Expanded(
        //     // child: Container(
        //     //     // foregroundDecoration: BoxDecoration(
        //     //     //   image: DecorationImage(
        //     //     //     // image: TagsDatabase().isSelected(widget.photoId)
        //     //     //     //     ? AssetImage('images/selected/selected4.png')
        //     //     //     //     : AssetImage('images/selected/transparent.png'),
        //     //     //     image: AssetImage('images/selected/transparent.png'),
        //     //     //     fit: BoxFit.fill,
        //     //     //   ),
        //     //     // ),
        //     //     // decoration: BoxDecoration(
        //     //     //   image: DecorationImage(
        //     //     //     alignment: Alignment(-.2, 0),
        //     //     //     image: fileImage,
        //     //     //     fit: BoxFit.cover,
        //     //     //   ),
        //     //     // ),
        //     //     // alignment: Alignment.bottomCenter,
        //     //     // padding: EdgeInsets.only(bottom: 20),
        //     //     // child: PhotoTagsThumb(photoId: widget.photoId),
        //     //     ),
        //     ),
        GestureDetector(
          onTap: () {
            print('hello');
          },
          //    child: PhotoTagsPhoto(photoId: photoId),
        ),
      ],
    );
    // });
  }
}
