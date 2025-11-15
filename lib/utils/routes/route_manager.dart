import 'package:e_commerce/auth-feature/presentation/get_started_page.dart';
import 'package:e_commerce/auth-feature/presentation/login_page.dart';
import 'package:e_commerce/auth-feature/presentation/register_page.dart';
import 'package:e_commerce/cart-feature/presentation/cart_page.dart';
import 'package:e_commerce/product-feature/presentation/home_page.dart';
import 'package:e_commerce/product-feature/presentation/product_page.dart';
import 'package:e_commerce/profile-feature/presentation/profile_page.dart';
import 'package:e_commerce/wishlist-feature/presentation/wishlist_page.dart';
import 'package:flutter/material.dart';

class RouteManager {
  RouteManager._();

  static const String getStartedPage = '/';
  static const String registerPage = '/registerPage';
  static const String loginPage = '/loginPage';
  static const String homePage = '/homePage';
  static const String productPage = '/productPage';
  static const String cartPage = '/cartPage';
  static const String wishListPage = '/wishListPage';
  static const String profilePage = '/profilePage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStartedPage:
        return MaterialPageRoute(builder: (context) => GetStartedPage());
      case homePage:
        return MaterialPageRoute(builder: (context) => HomePage());
      case productPage:
        return MaterialPageRoute(builder: (context) => ProductPage());
      case cartPage:
        return MaterialPageRoute(builder: (context) => CartPage());
      case wishListPage:
        return MaterialPageRoute(builder: (context) => WishListPage());
      case registerPage:
        return MaterialPageRoute(builder: (context) => RegisterPage());
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case profilePage:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      default:
        throw FormatException('Page not found! Check RouteManager.');
    }
  }
}
