// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/database/TagsInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTagInterface.dart';

class VoxTag implements VoxTagInterface {
  final String path;
  VoxTag({this.path}) {
    this.id = path.hashCode;
  }
  @override
  int id;
  @override
  String get thumbPath => path;
}

// Real class
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

// Mock class
class MockVoxTags extends Mock implements TagPhotoInterface {}

// Fake class
class FakeCat extends Fake implements TagPhotoInterface {
  @override
  bool eatFood(String food, {bool hungry}) {
    print('Fake eat $food');
    return true;
  }
}

void main() {
  VoxTags voxtags;
  TagPhotoInterface mockVoxTags;

  setUp(() {
    // Create mock object.
    voxtags = VoxTags();
    mockVoxTags = MockVoxTags();
    when(mockVoxTags.isTagged(any)).thenAnswer((params) {
      VoxTagInterface voxtag = params.positionalArguments[0];
      return voxtags.isTagged(voxtag);
    });
  });

  test("Let's verify some behaviour!", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    expect(mockVoxTags.isTagged(a), false);
  });
}
