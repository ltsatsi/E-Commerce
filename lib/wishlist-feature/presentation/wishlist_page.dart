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
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF1B1A1F),
        title: Text('Wish List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: wishProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.heart, size: 72),
                  SizedBox(height: 10),
                  Text('Wish list is empty', style: TextStyle(fontSize: 18)),
                ],
              ),
            )
          : Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ListView.builder(
                  itemCount: wishProducts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5,
                      ),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ref
                                        .read(wishProvider.notifier)
                                        .removeProduct(wishProducts[index]);
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: const Color(0xFF1B1A1F),
                                  ),
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
                                              .removeProduct(
                                                wishProducts[index],
                                              );
                                        },
                                  icon: Icon(
                                    CupertinoIcons.bag_badge_plus,
                                    color: const Color(0xFF1B1A1F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
      bottomNavigationBar: CBottomNavigation(),
    );
  }
}
