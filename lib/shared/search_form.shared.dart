import 'package:lutoi/model/search.param.model.dart';

class SearchFormShared {
  static SearchFormShared _sInstance;
  SearchFormShared._();
  static Future init() async {}
  factory SearchFormShared.shared() {
    if (_sInstance == null) {
      _sInstance = SearchFormShared._();
    }
    return _sInstance;
  }
  SearchParam _searchParam;


  void setParam(SearchParam value) {
    _searchParam = value;
  }

  SearchParam getParam() {
    return _searchParam;
  }

  void clearParam() {
    _searchParam = null;
  }

}