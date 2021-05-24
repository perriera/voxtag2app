import 'SelectPhotoInterface.dart';
import 'ChangeTagInterface.dart';
import 'TagPhotoInterface.dart';
import 'StoreTagInterface.dart';

abstract class TagsA extends StoreTagInterface {}

abstract class TagsB extends TagsA with SelectPhotoInterface {}

abstract class TagsC extends TagsB with ChangeTagInterface {}

abstract class VoxTagsInterface extends TagsC with TagPhotoInterface {
  VoxTagsInterface get instance;
}
