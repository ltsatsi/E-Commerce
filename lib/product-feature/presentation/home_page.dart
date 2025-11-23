import 'package:e_commerce/product-feature/models/product.dart';
import 'package:e_commerce/product-feature/providers/product_provider.dart';
import 'package:e_commerce/utils/routes/route_manager.dart';
import 'package:e_commerce/utils/widgets/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = ref.watch(searchedProductsProvider).isNotEmpty
        ? ref.watch(searchedProductsProvider)
        : ref.watch(productNotifierProvider);

    Color bgColor = const Color(0xFF1B1A1F);

    return Scaffold(
      // Application Bar

      // Home screen
      body: Stack(
        children: [
          Container(color: Colors.red),
          Container(
            height: 100,
            color: bgColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 14,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Welkom',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    CupertinoIcons.chevron_down,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Container(
              color: bgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.webSearch,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    final results = ref
                        .read(productNotifierProvider.notifier)
                        .search(value);

                    ref.read(searchedProductsProvider.notifier).state = results;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 12.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic_none_outlined),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Container(
              color: bgColor,
              height: 150,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${products.length} Results',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        PopupMenuButton<String>(
                          icon: const Icon(
                            CupertinoIcons.slider_horizontal_3,
                            color: Colors.white,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          onSelected: (value) {
                            // handle selection
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'all',
                              child: Text('All'),
                            ),
                            const PopupMenuItem(
                              value: 'desc',
                              child: Text('Price: High → Low'),
                            ),
                            const PopupMenuItem(
                              value: 'asc',
                              child: Text('Price: Low → High'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 215,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: 500,
              height: 590,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.66,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          // Handle tap
                          ref.read(selectedProductProvider.notifier).state =
                              product;
                          Navigator.of(
                            context,
                          ).pushNamed(RouteManager.productPage);
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: const Color(0xFFE2E2E2),
                                      ),
                                      left: BorderSide(
                                        color: const Color(0xFFE2E2E2),
                                      ),
                                      right: BorderSide(
                                        color: const Color(0xFFE2E2E2),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      width: 180,
                                      height: 180,
                                      products[index].image,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/fallback.jpg',
                                              fit: BoxFit.cover,
                                            );
                                          },
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 3,
                                  child: IconButton(
                                    onPressed: () {
                                      ref
                                          .read(
                                            productNotifierProvider.notifier,
                                          )
                                          .toggleLike(
                                            products[index].productId,
                                            ref,
                                          );
                                    },
                                    icon: products[index].isLiked
                                        ? Icon(CupertinoIcons.heart_fill)
                                        : Icon(CupertinoIcons.heart),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: const Color(0xFFE2E2E2),
                                  ),
                                  left: BorderSide(
                                    color: const Color(0xFFE2E2E2),
                                  ),
                                  right: BorderSide(
                                    color: const Color(0xFFE2E2E2),
                                  ),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  bottom: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      products[index].inStock
                                          ? 'In Stock'
                                          : 'Out of Stock',
                                    ),
                                    Text(
                                      'R ${products[index].price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: CBottomNavigation(),
    );
  }
}
