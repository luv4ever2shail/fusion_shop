import 'package:fusion_shop/src/pages/HomeScreen.dart';
import 'package:fusion_shop/src/pages/profile.dart';
import 'package:fusion_shop/src/pages/shopping_cart_page.dart';
import 'package:fusion_shop/src/widgets/BottomNavigationBar/bottomTabScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => BottomTabScreen(),
      '/home': (_) => HomeScreen(),
      '/shopcart': (_) => ShoppingCartPage(),
      '/profile': (_) => ProfilePage(),
    };
  }
}
