import 'package:lutoi/model/system.code.dart';

class SystemCodeService {
  static SystemCodeService _sInstance;
  SystemCodeService._();
  factory SystemCodeService.shared() {
    if (_sInstance == null) {
      _sInstance = SystemCodeService._();
    }
    return _sInstance;
  }

  List<SystemCodeItem> getSystemCode({String key = ''}) {
    List<SystemCodeItem> list = [];
    list.add(SystemCodeItem(name: 'All', value: 'All'));
    list.add(SystemCodeItem(name: 'Model1', value: 'Model1'));
    list.add(SystemCodeItem(name: 'Model2', value: 'Model2'));
    return list;
  }
}
