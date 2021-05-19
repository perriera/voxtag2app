import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';

class RefreshPhotosButton extends StatelessWidget {
  const RefreshPhotosButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<PhotosUpdate>(
    //     initialData: PhotosAlbum().photoIds,
    //     stream: getDescAlbumImg.stream,
    //     builder: (context, snapshot) {
    // print(snapshot.data);
    return NavBarButton(
      icon: FontAwesomeIcons.redo,
      title: "Update",
      onTap: () {
        print("RefreshPhotosButton");
      }, // RefreshPhotoUseCase(context),
    );
    // });
  }
}
