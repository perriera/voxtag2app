// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/TagPhotoInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';
import 'mock_VoxTag.dart';

class MockVoxTags extends Mock implements TagPhotoInterface {}

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
    when(mockVoxTags.tagsList(any)).thenAnswer((params) {
      VoxTagInterface voxtag = params.positionalArguments[0];
      return voxtags.tagsList(voxtag);
    });
  });

  test("isTagged on an empty set", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    expect(mockVoxTags.isTagged(a), false);
    expect(mockVoxTags.tagsList(a).length, 0);
  });
  test("isTagged on 1 item in set", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    mockVoxTags.tag(a, "alpha");
    expect(mockVoxTags.isTagged(a), true);
    expect(mockVoxTags.tagsList(a).length, 1);
  });
}
