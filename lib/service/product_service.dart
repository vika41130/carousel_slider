import 'package:lutoi/model/product_model.dart';

class ProductService {
  static ProductService _sInstance;
  ProductService._();
  factory ProductService.shared() {
    if (_sInstance == null) {
      _sInstance = ProductService._();
    }
    return _sInstance;
  }

  List<ProductModel> getProductList() {
    final List<ProductModel> list = [];
    for (var i = 1; i <= 8; i++) {
      list.add(ProductModel(
        id: i.toString(),
        name: 'BMW - X' + i.toString(),
        image: 'assets/images/bmw/bmw_logo.jpg',
        price: 10000 + i * 100.0,
      ));
    }
    return list;
  }
}