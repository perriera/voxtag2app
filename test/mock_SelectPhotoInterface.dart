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

// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/SelectPhotoInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';
import 'package:voxtag2app/voxtag2/usecases/voxtags/VoxTags.dart';
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
    when(mockVoxTags.anySelected()).thenAnswer((params) {
      return voxtags.anySelected();
    });
  });

  test("SelectPhotoInterface", () {
    // Interact with the mock object.
    VoxTag a = VoxTag(path: "a");
    expect(mockVoxTags.isSelected(a), false);
    expect(mockVoxTags.anySelected(), false);
    mockVoxTags.select(a);
    expect(mockVoxTags.isSelected(a), true);
    expect(mockVoxTags.anySelected(), true);
    mockVoxTags.unSelect(a);
    expect(mockVoxTags.isSelected(a), false);
    expect(mockVoxTags.anySelected(), false);
    mockVoxTags.toggleSelect(a);
    expect(mockVoxTags.isSelected(a), true);
    expect(mockVoxTags.anySelected(), true);
    mockVoxTags.toggleSelect(a);
    expect(mockVoxTags.isSelected(a), false);
    expect(mockVoxTags.anySelected(), false);
  });
}
