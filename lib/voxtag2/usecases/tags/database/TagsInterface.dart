import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTagInterface.dart';

///photosTagged
/// TagsInterface
///
abstract class VoxTagsStorageInterface {
  //
  // database reset
  //
  void reset();
  void load(String filename);
  void save(String filename);
  void align(List<VoxTagInterface> photoIds);
}

abstract class SelectPhotoInterface {
  //
  // individual SelectPhotoInterface methods
  //
  void select(VoxTagInterface photoId);
  void unSelect(VoxTagInterface photoId);
  bool isSelected(VoxTagInterface photoId);
  void toggleSelect(VoxTagInterface photoId);

  //
  // group SelectPhotoInterface methods
  //
  List<VoxTagInterface> allSelectedPhotos();
  void tagSelected(String tags, bool append);
  void clearSelected();
  void selectAll();
  void unSelectAll();
  void toggleSelectAll();
}

abstract class TagManagementInterface {
  //
  // individual TagManagementInterface methods
  //
  void removeTag(String tag);
  void changeTag(String oldTag, String newTag);
  //
  // group TagManagementInterface methods
  //
  List<String> allTags();
  int get totalNumberOfTags;
}

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

abstract class TagsA extends VoxTagsStorageInterface {}

abstract class TagsB extends TagsA with SelectPhotoInterface {}

abstract class TagsC extends TagsB with TagManagementInterface {}

abstract class TagsInterface extends TagsC with TagPhotoInterface {}
