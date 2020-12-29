import 'package:flutter/material.dart';

class ResourceFolderModel extends ChangeNotifier {
  String originalPath;
  String path;
  int totalFiles;
  ResourceFolderModel({this.originalPath, this.path, this.totalFiles});
}