import 'package:fusion_shop/src/model/category.dart';

class AppData {
  static List<Category> categoryList = [
    Category(),
    Category(
        id: 1, name: "Sneakers", image: 'assets/shoe.png', isSelected: true),
    Category(id: 2, name: "Jacket", image: 'assets/jacket.png'),
    Category(id: 3, name: "Watch", image: 'assets/watch.png'),
    Category(id: 4, name: "Shoes", image: 'assets/shoe.png'),
  ];
}
