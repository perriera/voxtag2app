// ignore_for_file: sdk_version_async_exported_from_core
// ignore_for_file: unawaited_futures
import 'package:voxtag2app/voxtag2/usecases/voxtags/interfaces/VoxTagInterface.dart';

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
