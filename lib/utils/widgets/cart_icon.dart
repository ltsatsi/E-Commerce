import 'package:e_commerce/cart-feature/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartIcon extends ConsumerStatefulWidget {
  const CartIcon({super.key});

  @override
  ConsumerState<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends ConsumerState<CartIcon> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(CupertinoIcons.bag),
        ),
        if (cartProducts.isNotEmpty)
          Positioned(
            child: Container(
              height: 17,
              width: 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text(
                  '${cartProducts.length}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
