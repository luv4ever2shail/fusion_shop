import 'package:fusion_shop/src/model/ebayItems.dart';
import 'package:flutter/widgets.dart';

class MyItems with ChangeNotifier {
  Items item;
  MyItems();
  MyItems.instance() : item = new Items();

  @override
  void dispose() {
    super.dispose();
  }

  setItem(Items _item) {
    item = _item;
    notifyListeners();
  }

  Items get getItem => item;
}
