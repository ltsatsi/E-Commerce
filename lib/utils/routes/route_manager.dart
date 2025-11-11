import 'package:e_commerce/cart-feature/presentation/cart_page.dart';
import 'package:e_commerce/product-feature/presentation/home_page.dart';
import 'package:e_commerce/product-feature/presentation/product_page.dart';
import 'package:flutter/material.dart';

class RouteManager {
  RouteManager._();

  static const String homePage = '/';
  static const String productPage = '/productPage';
  static const String cartPage = '/cartPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
      case productPage:
        return MaterialPageRoute(builder: (context) => ProductPage());
      case cartPage:
        return MaterialPageRoute(builder: (context) => CartPage());
      default:
        throw FormatException('Page not found! Check RouteManager.');
    }
  }
}
