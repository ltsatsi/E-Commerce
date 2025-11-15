import 'package:e_commerce/utils/routes/route_manager.dart';
import 'package:e_commerce/utils/widgets/cart_icon.dart';
import 'package:e_commerce/utils/widgets/wish_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CBottomNavigation extends StatefulWidget {
  const CBottomNavigation({super.key});

  @override
  State<CBottomNavigation> createState() => _CBottomNavigationState();
}

class _CBottomNavigationState extends State<CBottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueGrey[900],
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
          switch (_selectedIndex) {
            case 0:
              Navigator.of(context).pushNamed(RouteManager.homePage);
              break;
            case 1:
              Navigator.of(context).pushNamed(RouteManager.wishListPage);
              break;
            case 2:
              Navigator.of(context).pushNamed(RouteManager.cartPage);
              break;
            case 3:
              Navigator.of(context).pushNamed(RouteManager.profilePage);
              break;
          }
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: WishIcon(), label: 'Wishlist'),
        BottomNavigationBarItem(icon: CartIcon(), label: 'Bag'),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
