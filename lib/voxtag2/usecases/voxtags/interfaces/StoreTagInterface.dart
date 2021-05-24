import 'VoxTagInterface.dart';

///photosTagged
/// TagsInterface
///
abstract class StoreTagInterface {
  //
  // database reset
  //
  void reset();
  void load();
  void save();
  void align(List<VoxTagInterface> photoIds);
}
