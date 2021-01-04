
import 'package:lutoi/model/folder.model.dart';
import 'package:lutoi/model/resource.model.dart';

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

  List<Resource> getResource({int length}) {
    final List<Resource> list = [];
    list.add(Resource(fileName: 'BMW 1', url: 'assets/images/bmw/driver1.jpg'));
    list.add(Resource(fileName: 'BMW 2', url: 'assets/images/bmw/driver2.jpg'));
    list.add(Resource(fileName: 'BMW 3', url: 'assets/images/bmw/driver3.jpg'));
    list.add(Resource(fileName: 'BMW 4', url: 'assets/images/bmw/driver4.jpg'));
    list.add(Resource(fileName: 'BMW 5', url: 'assets/images/bmw/driver5.jpg'));
    list.add(Resource(fileName: 'BMW 6', url: 'assets/images/bmw/driver6.jpg'));
    list.add(Resource(fileName: 'BMW 7', url: 'assets/images/bmw/driver7.jpg'));
    list.add(Resource(fileName: 'BMW 8', url: 'assets/images/bmw/driver8.jpg'));

    if (length != null) {
      return list.sublist(0, length);
    }
    return list;
  }
}