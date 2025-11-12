import 'package:e_commerce/cart-feature/providers/cart_provider.dart';
import 'package:e_commerce/product-feature/providers/product_provider.dart';
import 'package:e_commerce/utils/widgets/bottom_navigation.dart';
import 'package:e_commerce/wishlist-feature/providers/wish_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  int qIncrement = 0;
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(selectedProductProvider);
    final cartProducts = ref.watch(cartProvider);

    if (product == null) {
      return Scaffold(body: Center(child: Text('No Product selected.')));
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: IconButton(
            icon: Icon(CupertinoIcons.chevron_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Product Details'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        child: Column(
          children: [
            // Image section
            Stack(
              children: [
                Container(
                  height: 290,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(29, 0, 0, 0),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Center(
                    child: Image.asset(product.image, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: product.inStock
                      ? Text('')
                      : Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? const Color(0x29FF1100)
                                : const Color.fromARGB(255, 216, 21, 7),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              product.inStock ? '' : 'Out of Stock',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Product details
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.desc,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'R ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Actions Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quantity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: product.quantity == 1
                          ? null
                          : () {
                              ref
                                  .read(cartProvider.notifier)
                                  .quantityIncrement(
                                    product,
                                    product.quantity - 1,
                                  );
                            },
                      icon: Icon(CupertinoIcons.minus),
                    ),
                    Text(
                      '${product.quantity}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        try {
                          if (!cartProducts.contains(product)) {
                            ref.read(cartProvider.notifier).addProduct(product);
                          }
                          ref
                              .read(cartProvider.notifier)
                              .quantityIncrement(product, product.quantity + 1);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please add to cart first')),
                          );
                        }
                      },
                      icon: Icon(CupertinoIcons.add),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {
                        ref.read(wishProvider.notifier).addProduct(product);
                      },
                      child: Icon(CupertinoIcons.heart),
                    ),
                    SizedBox(width: 10),
                    if (!cartProducts.contains(product))
                      SizedBox(
                        width: 285,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          onPressed: !product.inStock
                              ? null
                              : () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .addProduct(product);
                                },
                          child: Text('Add to Cart'),
                        ),
                      ),
                    if (cartProducts.contains(product))
                      SizedBox(
                        width: 285,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          onPressed: !product.inStock
                              ? null
                              : () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .removeProduct(product);
                                },
                          child: Text('Remove'),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: CBottomNavigation(),
    );
  }
}
