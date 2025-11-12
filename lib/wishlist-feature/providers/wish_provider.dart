import 'package:e_commerce/product-feature/models/product.dart';
import 'package:e_commerce/utils/helpers/helpers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishNotifier extends Notifier<List<Product>> {
  // Initial value
  @override
  List<Product> build() {
    return const [];
  }

  // State methods
  void addProduct(Product product) {
    state = [...state, product];
    state = Helper.removeDuplicates(state);
  }

  void quantityIncrement(Product product, int count) {
    Product stateProduct = state.firstWhere(
      (p) => p.productId == product.productId,
    );
    stateProduct.quantity = count;
    state = [...state, product];
    state = Helper.removeDuplicates(state);
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      product.quantity = 1;
      state = state.where((p) => p.productId != product.productId).toList();
    }
  }

  void clearWish() {
    if (state.isNotEmpty) {
      for (Product p in state) {
        p.quantity = 1;
      }
      state = [];
    }
  }
}

final wishProvider = NotifierProvider<WishNotifier, List<Product>>(
  () => WishNotifier(),
);
