// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/StoreTagInterface.dart';
import 'mock_VoxTag.dart';

class MockVoxTags extends Mock implements StoreTagInterface {}

void main() {
  VoxTags voxtags;
  StoreTagInterface mockVoxTags;

  setUp(() {
    // Create mock object.
    voxtags = VoxTags();
    mockVoxTags = MockVoxTags();
    when(mockVoxTags.load(any)).thenAnswer((params) {
      String name = params.positionalArguments[0];
      voxtags.load(name);
    });
    when(mockVoxTags.save(any)).thenAnswer((params) {
      String name = params.positionalArguments[0];
      String tags = params.positionalArguments[1];
      voxtags.save(name);
    });
  });

  test("isTagged on an empty set", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    mockVoxTags.load("a");
  });
  test("isTagged on 1 item in set", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    mockVoxTags.save("a");
  });
}
