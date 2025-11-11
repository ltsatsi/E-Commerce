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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: IconButton(
              onPressed: () {
                // Handle press
              },
              icon: Icon(Icons.person_outlined),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: 620,
              width: 500,
              child: cartProducts.isEmpty
                  ? Center(child: Text('Cart Empty'))
                  : ListView.builder(
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Image.asset(
                                height: 100,
                                width: 100,
                                cartProducts[index].image,
                              ),
                              title: Text(cartProducts[index].name),
                              subtitle: Text(
                                'R ${cartProducts[index].price.toStringAsFixed(2)}',
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .removeProduct(cartProducts[index]);
                                },
                                icon: Icon(CupertinoIcons.trash),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
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

      // Bottom Navigation
      bottomNavigationBar: CBottomNavigation(),
    );
  }
}
