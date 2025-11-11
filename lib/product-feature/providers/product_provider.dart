import 'package:e_commerce/product-feature/models/product.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

List<Product> allProducts = <Product>[
  Product(
    1,
    'Hoodie',
    'assets/images/hoodie.png',
    'Comfortable unisex grey hoodie made from premium cotton blend, perfect for casual wear and cool weather. Features a spacious front pocket and adjustable drawstring hood.',
    400,
  ),
  Product(
    2,
    'Crop Top',
    'assets/images/croptop.png',
    'Trendy and fashionable crop top with a modern fit. Ideal for layering or wearing alone, made from soft, breathable fabric that ensures all-day comfort.',
    299,
  ),
  Product(
    3,
    'Bubble Skirt',
    'assets/images/bubble_skirt.png',
    'Chic bubble hem skirt with a playful silhouette. This elegant piece features a flattering fit and versatile design that transitions seamlessly from day to night.',
    129,
    inStock: false,
  ),
  Product(
    4,
    'Jeans',
    'assets/images/girls_jeans.png',
    'Durable and stylish jeans designed for younger girls, featuring a comfortable elastic waistband and reinforced knees for active play. Made from high-quality denim that withstands daily wear.',
    300,
  ),
  Product(
    5,
    'Blue Jeans',
    'assets/images/blue_jeans.png',
    'Classic women\'s blue jeans with a perfect fit. Crafted from premium denim with just the right amount of stretch for comfort and mobility. Features a modern cut that flatters every body type.',
    100,
  ),
];

final productsProvider = Provider<List<Product>>((ref) {
  return allProducts;
});

final selectedProductProvider = StateProvider<Product?>((ref) => null);
