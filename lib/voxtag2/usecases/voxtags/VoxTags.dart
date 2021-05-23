// Real class

import 'interfaces/VoxTagInterface.dart';
import 'interfaces/VoxTagsInterface.dart';

class VoxTags implements VoxTagsInterface {
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

  @override
  void align(List<VoxTagInterface> photoIds) {
    // TODO: implement align
  }

  @override
  List<VoxTagInterface> allSelectedPhotos() {
    // TODO: implement allSelectedPhotos
    throw UnimplementedError();
  }

  @override
  List<String> allTags() {
    // TODO: implement allTags
    throw UnimplementedError();
  }

  @override
  void changeTag(String oldTag, String newTag) {
    // TODO: implement changeTag
  }

  @override
  void clearSelected() {
    // TODO: implement clearSelected
  }

  @override
  bool isSelected(VoxTagInterface photoId) {
    // TODO: implement isSelected
    throw UnimplementedError();
  }

  @override
  void load(String filename) {
    // TODO: implement load
  }

  @override
  void removeTag(String tag) {
    // TODO: implement removeTag
  }

  @override
  void reset() {
    // TODO: implement reset
  }

  @override
  void save(String filename) {
    // TODO: implement save
  }

  @override
  void select(VoxTagInterface photoId) {
    // TODO: implement select
  }

  @override
  void selectAll() {
    // TODO: implement selectAll
  }

  @override
  void tagSelected(String tags, bool append) {
    // TODO: implement tagSelected
  }

  @override
  void toggleSelect(VoxTagInterface photoId) {
    // TODO: implement toggleSelect
  }

  @override
  void toggleSelectAll() {
    // TODO: implement toggleSelectAll
  }

  @override
  // TODO: implement totalNumberOfTags
  int get totalNumberOfTags => throw UnimplementedError();

  @override
  void unSelect(VoxTagInterface photoId) {
    // TODO: implement unSelect
  }

  @override
  void unSelectAll() {
    // TODO: implement unSelectAll
  }
}
