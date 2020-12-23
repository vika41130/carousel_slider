import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class StateBase {
  // StateBase._();

  final LocalStorage storage = new LocalStorage('flutter_app');

  void setState(String key, dynamic value) {
    storage.setItem(key, value);
  }

  dynamic getState(String key) {
    return storage.getItem(key);
  }

  void removeState(String key) {
    storage.deleteItem(key);
  }
}