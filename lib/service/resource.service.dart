
import 'package:lutoi/model/folder.model.dart';

class ResourceService {
  static ResourceService _sInstance;
  ResourceService._();
  factory ResourceService.shared() {
    if (_sInstance == null) {
      _sInstance = ResourceService._();
    }
    return _sInstance;
  }

  List<ResourceFolderModel> getResourceFolder() {
    final List<ResourceFolderModel> list = [];
    list.add(ResourceFolderModel(
      originalPath: 'original path',
      path: 'AUSTRALIA > KONA > 2020 > J9W5D2G1XH > HAPW',
      totalFiles: 235,
    ));
    list.add(ResourceFolderModel(
      originalPath: 'original path',
      path: 'AUSTRALIA > KONA > 2020 > REGREHERHR > ETGEGRE',
      totalFiles: 200,
    ));
    list.add(ResourceFolderModel(
      originalPath: 'original path',
      path: 'AUSTRALIA > KONA > 2021 > TRJFGJDDT > EHRFJ',
      totalFiles: 134,
    ));
    list.add(ResourceFolderModel(
      originalPath: 'original path',
      path: 'AUSTRALIA > KONA > 2021 > TRJFGJDDT > 4Y66Y4',
      totalFiles: 270,
    ));
    return list;
  }
}