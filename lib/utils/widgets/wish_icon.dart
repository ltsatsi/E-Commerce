import 'package:e_commerce/wishlist-feature/providers/wish_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishIcon extends ConsumerStatefulWidget {
  const WishIcon({super.key});

  @override
  ConsumerState<WishIcon> createState() => _WishIconState();
}

class _WishIconState extends ConsumerState<WishIcon> {
  @override
  Widget build(BuildContext context) {
    final wishProducts = ref.watch(wishProvider);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(CupertinoIcons.bag),
        ),
        if (wishProducts.isNotEmpty)
          Positioned(
            child: Container(
              height: 17,
              width: 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey[900],
              ),
              child: Center(
                child: Text(
                  '${wishProducts.length}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
