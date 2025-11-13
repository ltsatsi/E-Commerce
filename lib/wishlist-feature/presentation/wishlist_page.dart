import 'package:e_commerce/cart-feature/providers/cart_provider.dart';
import 'package:e_commerce/utils/widgets/bottom_navigation.dart';
import 'package:e_commerce/wishlist-feature/providers/wish_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishListPage extends ConsumerStatefulWidget {
  const WishListPage({super.key});

  @override
  ConsumerState<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends ConsumerState<WishListPage> {
  @override
  Widget build(BuildContext context) {
    final wishProducts = ref.watch(wishProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Wish List'), centerTitle: true),
      body: wishProducts.isEmpty
          ? Center(child: Text('Wish list is empty'))
          : Expanded(
              child: ListView.builder(
                itemCount: wishProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      width: 60,
                      wishProducts[index].image,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          width: 60,
                          'assets/images/fallback.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    title: Text(wishProducts[index].name),
                    subtitle: Text(
                      'R ${wishProducts[index].price.toStringAsFixed(2)}',
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(color: const Color(0x1A000000)),
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(wishProvider.notifier)
                                  .removeProduct(wishProducts[index]);
                            },
                            icon: Icon(CupertinoIcons.trash),
                          ),
                          IconButton(
                            onPressed: !wishProducts[index].inStock
                                ? null
                                : () {
                                    ref
                                        .read(cartProvider.notifier)
                                        .addProduct(wishProducts[index]);
                                    ref
                                        .read(wishProvider.notifier)
                                        .removeProduct(wishProducts[index]);
                                  },
                            icon: Icon(CupertinoIcons.bag),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: CBottomNavigation(),
    );
  }
}
