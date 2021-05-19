import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_album_manager/photo_album_manager.dart';
import 'package:toast/toast.dart';
import 'package:voxtag2app/voxtag2/extensions/NavBarButton.dart';
import 'package:voxtag2app/voxtag2/system/load_path.dart';

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
        LoadPath.init().then((applicationPath) {
          print(applicationPath);
          // TagsStorage.init(applicationPath);
          // PhotosAlbum().init();
        });
        PhotoAlbumManager.checkPermissions().then((status) {
          Toast.show("权限同意 (granted)", context);
        }).catchError((error) {
          Toast.show("权限拒绝 (denied)", context);
        });
        // PermissionStatus status = await PhotoAlbumManager.checkPermissions();
        // if (status == PermissionStatus.granted) {
        //   Toast.show("权限同意 (granted)", context);
        // } else {
        //   Toast.show("权限拒绝 (denied)", context);
        // }
      }, // RefreshPhotoUseCase(context),
    );
    // });
  }
}
