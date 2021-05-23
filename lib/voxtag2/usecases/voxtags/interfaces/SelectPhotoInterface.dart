import 'VoxTagInterface.dart';

abstract class SelectPhotoInterface {
  //
  // individual SelectPhotoInterface methods
  //
  void select(VoxTagInterface photoId);
  void unSelect(VoxTagInterface photoId);
  bool isSelected(VoxTagInterface photoId);
  void toggleSelect(VoxTagInterface photoId);
  bool anySelected();

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
