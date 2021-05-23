import 'SelectPhotoInterface.dart';
import 'TagManagementInterface.dart';
import 'TagPhotoInterface.dart';
import 'VoxTagsStorageInterface.dart';

abstract class TagsA extends VoxTagsStorageInterface {}

abstract class TagsB extends TagsA with SelectPhotoInterface {}

abstract class TagsC extends TagsB with TagManagementInterface {}

abstract class VoxTagsInterface extends TagsC with TagPhotoInterface {
  VoxTagsInterface get instance;
}
