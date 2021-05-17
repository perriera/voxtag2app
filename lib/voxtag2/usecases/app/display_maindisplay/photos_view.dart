import 'package:flutter/cupertino.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/display_photos/photos_grid.dart';

class PhotosView extends StatelessWidget {
  const PhotosView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotosGrid();
  }
}
