import 'package:flutter/cupertino.dart';
import 'package:photo_album_manager/album_model_entity.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTag.dart';
import 'photo_loader.dart';

class PhotoView extends StatelessWidget {
  final VoxTag voxTag;

  const PhotoView({Key key, this.voxTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id = voxTag.entity.localIdentifier;
    return FutureBuilder<Widget>(
        initialData: Container(child: Text('Getting path...')),
        future: Future<Widget>.delayed(
          Duration(seconds: 0),
          () async {
            try {
              AlbumModelEntity entity =
                  await PhotoAlbumManager.getOriginalResource(id);
              String filename = entity.originalPath;
              return PhotoLoader(filename: filename);
            } catch (error) {
              print('PhotoViewer:future() $error');
              return Container(child: Text(error));
            }
          },
        ),
        builder: (context, snapshot) {
          return snapshot.data;
        });
  }
}
