import 'package:e_commerce/cart-feature/providers/cart_provider.dart';
import 'package:e_commerce/utils/widgets/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);
    final cartTotal = ref.watch(cartTotalProvider);
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
          child: Text('Cart'),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(''),
                TextButton(
                  onPressed: () {
                    ref.read(cartProvider.notifier).clearCart();
                  },
                  child: Text('Clear All'),
                ),
              ],
            ),
            SizedBox(
              height: 435,
              width: 500,
              child: cartProducts.isEmpty
                  ? Center(child: Text('Cart is Empty'))
                  : ListView.builder(
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      height: 100,
                                      width: 60,
                                      cartProducts[index].image,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Image.asset(
                                              height: 100,
                                              width: 60,
                                              'assets/images/fallback.jpg',
                                              fit: BoxFit.cover,
                                            );
                                          },
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartProducts[index].name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        GestureDetector(
                                          onTap: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'User wants backup for ${cartProducts[index].name}',
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x1A000000),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 10,
                                                  ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.swap_horiz),
                                                  SizedBox(width: 10),
                                                  Text('Pick a backup'),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'R ${cartProducts[index].totalPrice.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        if (cartProducts[index].quantity <= 1)
                                          IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(cartProvider.notifier)
                                                  .quantityIncrement(
                                                    cartProducts[index],
                                                    1,
                                                  );
                                              ref
                                                  .read(cartProvider.notifier)
                                                  .removeProduct(
                                                    cartProducts[index],
                                                  );
                                            },
                                            icon: Icon(CupertinoIcons.trash),
                                          ),
                                        if (cartProducts[index].quantity > 1)
                                          IconButton(
                                            onPressed: () {
                                              ref
                                                  .read(cartProvider.notifier)
                                                  .quantityIncrement(
                                                    cartProducts[index],
                                                    cartProducts[index]
                                                            .quantity -
                                                        1,
                                                  );
                                            },
                                            icon: Icon(CupertinoIcons.minus),
                                          ),
                                        Text(
                                          '${cartProducts[index].quantity}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            ref
                                                .read(cartProvider.notifier)
                                                .quantityIncrement(
                                                  cartProducts[index],
                                                  cartProducts[index].quantity +
                                                      1,
                                                );
                                          },
                                          icon: Icon(CupertinoIcons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SubTotal:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'R ${cartTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wallet Credit Applied:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'R0.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'R ${cartTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: cartProducts.isEmpty ? null : () {},
                        child: Text('Checkout'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: CBottomNavigation(),
    );
  }
}
