import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voxtag2app/voxtag2/instance/VoxTag2.dart';
import 'package:voxtag2app/voxtag2/usecases/photo/view_photo.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTag.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display/photo_tags.dart';

class PhotoThumbnail extends StatefulWidget {
  final AsyncSnapshot<FileImage> snapshot;
  final VoxTag photoId;
  const PhotoThumbnail({
    Key key,
    @required this.snapshot,
    @required this.photoId,
  }) : super(key: key);

  @override
  _PhotoThumbnailState createState() => _PhotoThumbnailState();
}

class _PhotoThumbnailState extends State<PhotoThumbnail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          //   TagsDatabase().toggleSelect(widget.photoId);
        });
      },
      onDoubleTap: () {
        PhotoViewer.voxTag = widget.photoId;
        Navigator.pushNamed(context, VoxTag2.photoView);
      },
      child: Container(
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
            // image: TagsDatabase().isSelected(widget.photoId)
            //     ? AssetImage('images/selected/selected4.png')
            //     : AssetImage('images/selected/transparent.png'),
            image: AssetImage('images/selected/transparent.png'),
            fit: BoxFit.fill,
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment(-.2, 0),
            image: widget.snapshot.data,
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 20),
        child: PhotoTagsThumb(photoId: widget.photoId),
      ),
    );
  }
}
