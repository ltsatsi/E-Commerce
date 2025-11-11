import 'package:e_commerce/utils/routes/route_manager.dart';
import 'package:e_commerce/utils/widgets/cart_icon.dart';
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
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
          switch (_selectedIndex) {
            case 0:
              Navigator.of(context).pushNamed(RouteManager.homePage);
              break;
            case 2:
              Navigator.of(context).pushNamed(RouteManager.cartPage);
              break;
          }
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(icon: CartIcon(), label: 'Cart'),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
