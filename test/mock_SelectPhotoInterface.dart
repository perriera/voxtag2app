// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagsInterface.dart';
import 'mock_VoxTag.dart';

class MockVoxTags extends Mock implements SelectPhotoInterface {}

void main() {
  VoxTags voxtags;
  SelectPhotoInterface mockVoxTags;

  setUp(() {
    // Create mock object.
    voxtags = VoxTags();
    mockVoxTags = MockVoxTags();
    when(mockVoxTags.select(any)).thenAnswer((params) {
      VoxTagInterface voxtag = params.positionalArguments[0];
      voxtags.select(voxtag);
    });
    when(mockVoxTags.unSelect(any)).thenAnswer((params) {
      VoxTagInterface voxtag = params.positionalArguments[0];
      voxtags.unSelect(voxtag);
    });
    when(mockVoxTags.isSelected(any)).thenAnswer((params) {
      VoxTagInterface voxtag = params.positionalArguments[0];
      return voxtags.isSelected(voxtag);
    });
    when(mockVoxTags.toggleSelect(any)).thenAnswer((params) {
      VoxTagInterface voxtag = params.positionalArguments[0];
      voxtags.toggleSelect(voxtag);
    });
  });

  test("SelectPhotoInterface", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    expect(mockVoxTags.isSelected(a), false);
    mockVoxTags.select(a);
    expect(mockVoxTags.isSelected(a), true);
    mockVoxTags.unSelect(a);
    expect(mockVoxTags.isSelected(a), false);
    mockVoxTags.toggleSelect(a);
    expect(mockVoxTags.isSelected(a), true);
    mockVoxTags.toggleSelect(a);
    expect(mockVoxTags.isSelected(a), false);
  });
}
