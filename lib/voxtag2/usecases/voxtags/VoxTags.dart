///
/// @brief the "MIT/X Consortium License", (adapted for EXPARX.COM)
///
/// Copyright (C) November 22, 2021 EXPARX INCORPORATED
///
/// Permission is hereby  granted,  free of charge,  to  any  person
/// obtaining a copy of this software and  associated  documentation
/// files   (the  "Software"),  to deal  in   the  Software  without
/// restriction, including  without  limitation the rights  to  use,
/// copy,  modify, merge,  publish,  distribute,  sublicense, and/or
/// sell copies of the  Software, and to permit persons  to whom the
/// Software  is  furnished to  do  so,  subject  to  the  following
/// conditions:
///
/// (See LICENSE.md for complete details)
///

// Real class

import 'package:voxtag2app/voxtag2/usecases/photos/database/PhotoAlbum.dart';

import '../../extensions/CapExtensions.dart';
import 'access/obsolete/TagStorage.dart';
import 'interfaces/VoxTagInterface.dart';
import 'interfaces/VoxTagsInterface.dart';

class VoxTags implements VoxTagsInterface {
  Map<int, String> _photoTags = Map<int, String>();
  Map<int, VoxTagInterface> _selected = Map<int, VoxTagInterface>();
  // Map<int, VoxTagInterface> _taggedPhotos = Map<int, VoxTagInterface>();
  final String _filename = "VoxTags";

  static VoxTagsInterface _instance;

  @override
  VoxTagsInterface get instance {
    if (_instance == null) {
      _instance = VoxTags();
      _instance.load();
    }
    return _instance;
  }

  @override
  bool anySelected() {
    return _selected.isNotEmpty;
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
  void append(VoxTagInterface photoId, String newTag) {
    var update = (tags(photoId) + " " + newTag).trim();
    tag(photoId, update);
  }

  @override
  bool isTagged(VoxTagInterface photoId) {
    return _photoTags.containsKey(photoId.id);
  }

  @override
  void remove(VoxTagInterface photoId, String tag) {
    var key = photoId.id;
    if (_photoTags[key].contains(tag)) {
      var oldTag = _photoTags[key].trim() + " ";
      oldTag = oldTag.replaceAll(tag + " ", "").trim();
      _photoTags[key] = oldTag;
      if (_instance.totalNumberOfTags == 0) {
        _photoTags.remove(key);
      }
    }
  }

  @override
  void removeAll() {
    // TODO: implement removeAll
  }

  @override
  List<VoxTagInterface> searchTags(String query, bool andOr) {
    List<VoxTagInterface> list = this.allTaggedPhotos();
    List<VoxTagInterface> results = [];
    for (VoxTagInterface photoId in list) {
      String tags = _photoTags[photoId.id];
      if (query.containsWord(tags, andOr)) results.add(photoId);
    }
    return results;
  }

  @override
  void tag(VoxTagInterface photoId, String tags) {
    // _taggedPhotos[photoId.id] = photoId;
    _photoTags[photoId.id] = tags.filteredForVoxTag;
  }

  @override
  String tags(VoxTagInterface photoId) {
    if (!isTagged(photoId)) return "";
    return _photoTags[photoId.id];
  }

  @override
  List<String> tagsList(VoxTagInterface photoId) {
    String _tags = tags(photoId);
    if (_tags != null && _tags.trim().length > 0) {
      List<String> result = _tags.trim().split(" ");
      return result;
    } else
      return [];
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
    List<VoxTagInterface> list = [];
    for (VoxTagInterface photoId in _selected.values) list.add(photoId);
    return list;
  }

  @override
  List<String> allTags() {
    List<String> allTags = [];
    for (var entry in _photoTags.entries) {
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
          if (_photoTags.containsKey(key)) _photoTags.remove(key);
          _photoTags[key] = tags;
        }
      }
    }
  }

  void assertCheckParameters(String oldTag, String newTag) {
    if (oldTag == newTag) throw 'No changes made';
    if (newTag.length == 0) throw 'No change specified';
  }

  @override
  void clearSelected() {
    _selected = Map<int, VoxTagInterface>();
  }

  @override
  bool isSelected(VoxTagInterface photoId) {
    return _selected.containsKey(photoId.id);
  }

  @override
  void load() {
    try {
      TagsStorage storage = TagsStorage(filename: _filename);
      _photoTags = storage.load();
    } catch (error) {
      print(error);
    }
  }

  @override
  void removeTag(String tag) {
    for (VoxTagInterface photoId in _instance.allTaggedPhotos()) {
      var tags = _instance.tags(photoId).toLowerCase();
      if (tags.length > 0) {
        if (tags.containsWord(tag.toLowerCase(), false)) {
          int key = photoId.id;
          if (_photoTags.containsKey(key)) _photoTags.remove(key);
          if (_selected != null && _selected.containsKey(key))
            _selected.remove(key);
        }
      }
    }
  }

  @override
  void reset() {
    // TODO: implement reset
  }

  @override
  void save() {
    try {
      TagsStorage storage = TagsStorage(filename: _filename);
      storage.save(voxTags: _photoTags);
    } catch (error) {
      print(error);
    }
  }

  @override
  void select(VoxTagInterface photoId) {
    if (!isSelected(photoId)) _selected[photoId.id] = photoId;
  }

  @override
  void selectAll() {
    // TODO: implement selectAll
  }

  @override
  void tagSelected(String tags, bool add) {
    List<VoxTagInterface> list = allSelectedPhotos();
    for (VoxTagInterface photoId in list)
      if (add)
        append(photoId, tags);
      else
        tag(photoId, tags);
  }

  @override
  void toggleSelect(VoxTagInterface photoId) {
    if (isSelected(photoId))
      unSelect(photoId);
    else
      select(photoId);
  }

  @override
  void toggleSelectAll() {
    // TODO: implement toggleSelectAll
  }

  @override
  int get totalNumberOfTags => _photoTags.length;

  @override
  void unSelect(VoxTagInterface photoId) {
    if (isSelected(photoId)) _selected.remove(photoId.id);
  }

  @override
  void unSelectAll() {
    // TODO: implement unSelectAll
  }

  @override
  bool get hasTags => totalNumberOfTags > 0;
}
