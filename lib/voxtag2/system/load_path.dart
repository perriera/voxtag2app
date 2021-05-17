import 'package:path_provider/path_provider.dart';

class LoadPath {
  static String applicationDocumentsDirectory;

  static Future<String> init() async {
    final path = await getApplicationDocumentsDirectory();
    applicationDocumentsDirectory = path.path;
    return applicationDocumentsDirectory;
  }
}
