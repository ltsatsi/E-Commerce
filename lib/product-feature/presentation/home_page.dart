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
  String sortOrder = 'all';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productNotifierProvider);

    return Scaffold(
      // Application Bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text('MyApp'),
        ),
      ),

      // Home screen
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            right: 30,
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${products.length} Results',
                    style: TextStyle(fontSize: 18),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(CupertinoIcons.slider_horizontal_3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    onSelected: (value) {
                      // handle selection
                      sortOrder = value;
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'all', child: Text('All')),
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
            ),
          ),
          Positioned(
            top: 160,
            left: 15,
            right: 15,
            child: SizedBox(
              width: 500,
              height: 550,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.66,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: const EdgeInsets.all(5),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0x14000000),
                                  borderRadius: BorderRadius.zero,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    width: 180,
                                    height: 180,
                                    products[index].image,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 3,
                                child: IconButton(
                                  onPressed: () {
                                    ref
                                        .read(productNotifierProvider.notifier)
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
                          SizedBox(height: 5),
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
                  );
                },
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
