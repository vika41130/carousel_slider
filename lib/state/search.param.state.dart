import 'package:lutoi/model/search.param.model.dart';
import 'package:lutoi/state/state.base.dart';
import 'package:lutoi/state/state.key.dart';

class SearchParamState extends StateBase {
  static SearchParamState _sInstance;
  SearchParamState._();

  static Future init() async {}

  factory SearchParamState.shared() {
    if (_sInstance == null) {
      _sInstance = SearchParamState._();
    }
    return _sInstance;
  }

  void setParam(SearchParam value) {
    super.setState(StateKey.SEARCH_PARAM, value.toJson());
  }

  SearchParam getParam() {
    final params = super.getState(StateKey.SEARCH_PARAM);
    final SearchParam result = SearchParam();
    result.fromJson(params);
    return result;
  }

  void removeParam() {
    super.removeState(StateKey.SEARCH_PARAM);
  }

}