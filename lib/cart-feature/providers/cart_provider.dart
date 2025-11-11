import 'package:e_commerce/product-feature/models/product.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<List<Product>> {
  // Initial value
  @override
  List<Product> build() {
    return const [];
  }

  // State methods
  void addProduct(Product product) {
    state = [...state, product];
    Helper.removeDuplicates(state);
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.productId != product.productId).toList();
    }
  }

  void clearCart() {
    if (state.isNotEmpty) {
      state = [];
    }
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<Product>>(
  () => CartNotifier(),
);

final cartTotalProvider = Provider((ref) {
  final cartProducts = ref.watch(cartProvider);
  double sum = 0.00;

  for (var p in cartProducts) {
    sum += p.price;
  }

  return sum;
});
