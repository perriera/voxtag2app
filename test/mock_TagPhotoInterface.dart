// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:voxtag2app/voxtag2/usecases/tags/database/TagsInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTagInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';

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
    when(mockVoxTags.tag(any, any)).thenAnswer((params) {
      VoxTagInterface voxtag = params.positionalArguments[0];
      String tags = params.positionalArguments[1];
      voxtags.tag(voxtag, tags);
    });
  });

  test("isTagged on an empty set", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    expect(mockVoxTags.isTagged(a), false);
  });
  test("isTagged on 1 item in set", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    mockVoxTags.tag(a, "alpha");
    expect(mockVoxTags.isTagged(a), true);
  });
}
