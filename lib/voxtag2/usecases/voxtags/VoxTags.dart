// Real class

import 'interfaces/VoxTagInterface.dart';
import 'interfaces/VoxTagsInterface.dart';

class VoxTags implements TagPhotoInterface {
  Map<int, String> _photoTags = Map<int, String>();
  Map<int, VoxTagInterface> _selected = Map<int, VoxTagInterface>();
  Map<int, VoxTagInterface> _taggedPhotos = Map<int, VoxTagInterface>();
  @override
  List<VoxTagInterface> allTaggedPhotos() {
    // TODO: implement allTaggedPhotos
    throw UnimplementedError();
  }

  @override
  void append(VoxTagInterface photoId, String tags) {
    // TODO: implement append
  }

  @override
  bool isTagged(VoxTagInterface photoId) {
    return _photoTags.containsKey(photoId.id) &&
        _taggedPhotos.containsKey(photoId.id);
  }

  @override
  void remove(VoxTagInterface photoId, String tag) {
    // TODO: implement remove
  }

  @override
  void removeAll() {
    // TODO: implement removeAll
  }

  @override
  List<VoxTagInterface> searchTags(String tags, bool andOr) {
    // TODO: implement searchTags
    throw UnimplementedError();
  }

  @override
  void tag(VoxTagInterface photoId, String tags) {
    _taggedPhotos[photoId.id] = photoId;
    _photoTags[photoId.id] = tags;
  }

  @override
  String tags(VoxTagInterface photoId) {
    // TODO: implement tags
    throw UnimplementedError();
  }

  @override
  List<String> tagsList(VoxTagInterface photoId) {
    // TODO: implement tagsList
    throw UnimplementedError();
  }

  @override
  void unTag(VoxTagInterface photoId) {
    // TODO: implement unTag
  }
}
