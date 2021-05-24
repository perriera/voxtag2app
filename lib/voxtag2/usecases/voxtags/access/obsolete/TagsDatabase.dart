// import 'package:voxtag2app/voxtag3/models/photos_album.dart';

// import '../app/extensions/string.dart';
// import '../views/photos/usecases/display_photos/photos_stream.dart';
// import 'interfaces/tags_interface.dart';
// import 'interfaces/voxtag_interface.dart';
// import 'tags_storage.dart';

import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';
import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotosUpdate.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagsInterface.dart';

import '../../../../extensions/CapExtensions.dart';
import 'TagStorage.dart';

///
/// TagsDatabase
///
class TagsDatabase implements VoxTagsInterface {
  static TagsDatabase _instance;
  Map<int, String> photoTags;
  Map<int, VoxTagInterface> selected;
  Map<int, VoxTagInterface> photosTagged;
  final String _filename = "TagsDatabase.json";

  TagsDatabase() {
    if (_instance == null) {
      photoTags = Map<int, String>();
      selected = Map<int, VoxTagInterface>();
      photosTagged = Map<int, VoxTagInterface>();
      _instance = this;
      _instance.load();
    }
  }

  @override
  void tag(VoxTagInterface photoId, String tags) {
    if (isTagged(photoId)) _instance.photoTags.remove(photoId.id);
    _instance.photoTags[photoId.id] = tags;
    _instance.photosTagged[photoId.id] = photoId;
  }

  @override
  bool isTagged(VoxTagInterface photoId) {
    return _instance.photoTags.containsKey(photoId.id);
  }

  @override
  int get totalNumberOfTags => _instance.photoTags.length;

  @override
  String tags(VoxTagInterface photoId) {
    if (!isTagged(photoId)) return "";
    return _instance.photoTags[photoId.id];
  }

  @override
  void remove(VoxTagInterface photoId, String tag) {
    var key = photoId.id;
    if (_instance.photoTags[key].contains(tag)) {
      var oldTag = _instance.photoTags[key].trim() + " ";
      oldTag = oldTag.replaceAll(tag + " ", "").trim();
      _instance.photoTags[key] = oldTag;
      var inspect0 = _instance.photoTags;
      var inspect1 = _instance;
      if (_instance.totalNumberOfTags == 0) {
        _instance.photoTags.remove(key);
      }
    }
    if (_instance.photosTagged.containsKey(key))
      _instance.photosTagged.remove(key);
  }

  @override
  void unTag(VoxTagInterface photoId) {
    var key = photoId.id;
    if (_instance.photoTags.containsKey(key)) _instance.photoTags.remove(key);
  }

  @override
  void append(VoxTagInterface photoId, String newTag) {
    var update = (tags(photoId) + " " + newTag).trim();
    tag(photoId, update);
  }

  @override
  List<String> allTags() {
    List<String> allTags = List<String>();
    for (var entry in _instance.photoTags.entries) {
      String tags = entry.value;
      tags = tags.allWordsInCaps;
      var words = tags.split(" ");
      for (var tag in words) {
        if (tag.length > 0 && !allTags.contains(tag)) {
          allTags.add(tag);
        }
      }
    }
    allTags.sort();
    return allTags;
  }

  @override
  List<VoxTagInterface> allTaggedPhotos() {
    var allPhotoIds = PhotosAlbum().photoIds;
    List<VoxTagInterface> list = [];
    for (var photoId in allPhotoIds.photos)
      if (isTagged(photoId)) list.add(photoId);
    return list;
  }

  @override
  void select(VoxTagInterface photoId) {
    if (!isSelected(photoId)) _instance.selected[photoId.id] = photoId;
  }

  @override
  void unSelect(VoxTagInterface photoId) {
    if (isSelected(photoId)) _instance.selected.remove(photoId.id);
  }

  @override
  bool isSelected(VoxTagInterface photoId) {
    return _instance.selected.containsKey(photoId.id);
  }

  @override
  void toggleSelect(VoxTagInterface photoId) {
    if (isSelected(photoId))
      unSelect(photoId);
    else
      select(photoId);
  }

  @override
  void clearSelected() {
    _instance.selected = Map<int, VoxTagInterface>();
    PhotosStream.refresh();
  }

  @override
  void tagSelected(String tags, bool add) {
    List<VoxTagInterface> list = allSelectedPhotos();
    for (VoxTagInterface photoId in list)
      if (add)
        append(photoId, tags);
      else
        tag(photoId, tags);
    PhotosStream.refresh();
  }

  @override
  void load() {
    try {
      TagsStorage dataBase = TagsStorage(filename: _filename);
      _instance.photoTags = dataBase.load();
    } catch (error) {
      print(error);
    }
  }

  @override
  void save() {
    try {
      TagsStorage dataBase = TagsStorage(filename: _filename);
      dataBase.save(voxTags: _instance.photoTags);
    } catch (error) {
      print(error);
    }
  }

  @override
  void removeAll() {
    _instance.photoTags = Map<int, String>();
    _instance.selected = Map<int, VoxTagInterface>();
    _instance.photosTagged = Map<int, VoxTagInterface>();
  }

  @override
  List<VoxTagInterface> allSelectedPhotos() {
    List<VoxTagInterface> list = [];
    for (VoxTagInterface photoId in _instance.selected.values)
      list.add(photoId);
    return list;
  }

  @override
  List<VoxTagInterface> searchTags(String searchTags, bool andOr) {
    List<VoxTagInterface> list = this.allTaggedPhotos();
    List<VoxTagInterface> results = [];
    for (VoxTagInterface photoId in list) {
      String tags = _instance.photoTags[photoId.id];
      if (tags.containsWord(searchTags, andOr)) results.add(photoId);
    }
    return results;
  }

  @override
  void align(List<VoxTagInterface> allPhotoIds) {
    _instance.photosTagged = Map<int, VoxTagInterface>();
    for (VoxTagInterface photoId in allPhotoIds)
      if (isTagged(photoId)) _instance.photosTagged[photoId.id] = photoId;
  }

  @override
  void selectAll() {
    var allPhotoIds = PhotosAlbum().photoIds;
    for (VoxTagInterface photoId in allPhotoIds.photos) select(photoId);
    PhotosStream.refresh();
  }

  @override
  void unSelectAll() {
    _instance.selected = Map<int, VoxTagInterface>();
    PhotosStream.refresh();
  }

  @override
  void toggleSelectAll() {
    if (_instance.selected.length > 0)
      unSelectAll();
    else
      selectAll();
  }

  @override
  void reset() {
    _instance = null;
  }

  @override
  void removeTag(String tag) {
    for (VoxTagInterface photoId in _instance.allTaggedPhotos()) {
      var tags = _instance.tags(photoId).toLowerCase();
      if (tags.length > 0) {
        if (tags.containsWord(tag.toLowerCase(), false)) {
          int key = photoId.id;
          if (_instance.photoTags.containsKey(key))
            _instance.photoTags.remove(key);
          if (_instance.photosTagged.containsKey(key))
            _instance.photosTagged.remove(key);
          if (_instance.selected != null && _instance.selected.containsKey(key))
            _instance.selected.remove(key);
        }
      }
    }
  }

  @override
  void changeTag(String oldTag, String newTag) {
    assertCheckParameters(oldTag, newTag);
    for (VoxTagInterface photoId in _instance.allTaggedPhotos()) {
      var tags = _instance.tags(photoId).toLowerCase();
      if (tags.length > 0) {
        if (tags.containsWord(oldTag.toLowerCase(), false)) {
          int key = photoId.id;
          tags = oldTag
              .toLowerCase()
              .replaceAll(oldTag.toLowerCase(), newTag.toLowerCase());
          if (_instance.photoTags.containsKey(key))
            _instance.photoTags.remove(key);
          _instance.photoTags[key] = tags;
        }
      }
    }
  }

  void assertCheckParameters(String oldTag, String newTag) {
    if (oldTag == newTag) throw 'No changes made';
    if (newTag.length == 0) throw 'No change specified';
  }

  @override
  List<String> tagsList(VoxTagInterface photoId) {
    String tags = _instance.tags(photoId);
    if (tags != null && tags.trim().length > 0) {
      List<String> result = tags.trim().split(" ");
      return result;
    } else
      return List<String>();
  }

  @override
  VoxTagsInterface get instance {
    // TODO: implement instance
    throw UnimplementedError();
  }

  @override
  bool anySelected() {
    // TODO: implement anySelected
    throw UnimplementedError();
  }
}

// String tagValue(TagInterface photoEntry);
// List<String> allTags();
// List<String> allUniqueTags();

// void select(TagInterface photoEntry);
// void unSelect(TagInterface photoEntry);
// void toggleSelect(TagInterface photoEntry);
// bool isSelected(TagInterface photoEntry);
// void clearSelected();
// bool itemsSelected();
