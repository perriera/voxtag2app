import 'VoxTagInterface.dart';

abstract class TagPhotoInterface {
  //
  // individual TagPhotoInterface methods
  //
  void tag(VoxTagInterface photoId, String tags);
  bool isTagged(VoxTagInterface photoId);
  String tags(VoxTagInterface photoId);
  List<String> tagsList(VoxTagInterface photoId);
  void remove(VoxTagInterface photoId, String tag);
  void unTag(VoxTagInterface photoId);
  void append(VoxTagInterface photoId, String tags);
  void removeAll();

  //
  // group TagPhotoInterface methods
  //
  List<VoxTagInterface> allTaggedPhotos();
  List<VoxTagInterface> searchTags(String tags, bool andOr);
}
