
class ProductService {
  static ProductService _sInstance;
  ProductService._();
  factory ProductService.shared() {
    if (_sInstance == null) {
      _sInstance = ProductService._();
    }
    return _sInstance;
  }

  List<dynamic> getProductList() {
    final int count = 20;
    final List<dynamic> list = [];
    for (var i = 0; i < count; i++) {
      list.add(i);
    }
    return list;
  }
}