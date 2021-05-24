abstract class ChangeTagInterface {
  //
  // individual TagManagementInterface methods
  //
  void removeTag(String tag);
  void changeTag(String oldTag, String newTag);
  //
  // group TagManagementInterface methods
  //
  List<String> allTags();
  int get totalNumberOfTags;
}
