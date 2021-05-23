import 'VoxTagInterface.dart';

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
