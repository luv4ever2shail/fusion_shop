import 'package:fusion_shop/src/model/ebayItems.dart';
import 'package:flutter/widgets.dart';

class MyCart with ChangeNotifier {
  List<Product> products;
  MyCart();
  MyCart.instance() : products = new List<Product>();

  @override
  void dispose() {
    super.dispose();
  }

  addProduct(Product _item) {
    products.add(_item);
    notifyListeners();
  }

  List<Product> get getItems => products;
}
