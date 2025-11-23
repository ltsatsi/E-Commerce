import 'package:e_commerce/product-feature/models/product.dart';
import 'package:e_commerce/wishlist-feature/providers/wish_provider.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Product(
    6,
    'White Sneakers',
    'assets/images/white_sneakers.png',
    'Comfortable and stylish white sneakers made with breathable fabric and a durable rubber sole. Perfect for everyday wear and casual outfits.',
    120,
  ),
  Product(
    7,
    'Leather Jacket',
    'assets/images/leather_jacket.png',
    'Premium black leather jacket with a sleek fit and soft inner lining. A timeless piece for both casual and evening wear.',
    250,
  ),
  Product(
    8,
    'Red Hoodie',
    'assets/images/red_hoodie.png',
    'Cozy red hoodie with adjustable drawstrings and front pocket. Made from soft cotton blend for warmth and comfort.',
    90,
  ),
  Product(
    9,
    'Classic T-Shirt',
    'assets/images/classic_tshirt.png',
    'Simple and stylish cotton t-shirt available in multiple colors. Lightweight, breathable, and perfect for layering.',
    45,
  ),
  Product(
    10,
    'Denim Jacket',
    'assets/images/denim_jacket.png',
    'Light blue denim jacket with metal buttons and side pockets. Designed for comfort and versatile wear all year round.',
    150,
  ),
  Product(
    11,
    'Black Dress',
    'assets/images/black_dress.png',
    'Elegant black dress made from stretchable fabric with a flattering silhouette. Perfect for parties and formal occasions.',
    200,
  ),
  Product(
    12,
    'Running Shoes',
    'assets/images/running_shoes.png',
    'High-performance running shoes designed for comfort and durability. Lightweight mesh upper and shock-absorbing sole.',
    130,
  ),
  Product(
    13,
    'Brown Boots',
    'assets/images/brown_boots.png',
    'Rugged brown leather boots with excellent grip and comfort. Great for outdoor adventures or casual city wear.',
    210,
  ),
  Product(
    14,
    'Slim Fit Chinos',
    'assets/images/slim_fit_chinos.png',
    'Versatile slim-fit chinos crafted from soft cotton with a hint of stretch. Ideal for office or weekend wear.',
    110,
  ),
  Product(
    15,
    'Sports Watch',
    'assets/images/sports_watch.png',
    'Digital sports watch with waterproof design and step tracking. A must-have for fitness enthusiasts.',
    180,
  ),
  Product(
    16,
    'Graphic Tee',
    'assets/images/graphic_tee.png',
    'Trendy printed t-shirt made from 100% cotton. Combines comfort with bold urban style.',
    60,
  ),
  Product(
    17,
    'Casual Shorts',
    'assets/images/casual_shorts.png',
    'Lightweight cotton shorts with drawstring waist for everyday comfort. Perfect for summer outings.',
    70,
  ),
  Product(
    18,
    'Wool Sweater',
    'assets/images/wool_sweater.png',
    'Soft wool-blend sweater with ribbed cuffs and neckline. Keeps you warm in style.',
    140,
  ),
  Product(
    19,
    'Black Belt',
    'assets/images/black_belt.png',
    'Classic black leather belt with a metallic buckle. Adds sophistication to any outfit.',
    50,
  ),
  Product(
    20,
    'Cap',
    'assets/images/cap.png',
    'Stylish cotton baseball cap with adjustable strap. Ideal for sunny days or sporty looks.',
    35,
  ),
  Product(
    21,
    'Sunglasses',
    'assets/images/sunglasses.png',
    'UV-protected aviator sunglasses with metallic frame. Combines durability and modern aesthetics.',
    95,
  ),
  Product(
    22,
    'Winter Coat',
    'assets/images/winter_coat.png',
    'Heavy-duty coat designed for warmth during cold weather. Quilted inner layer and detachable hood.',
    300,
  ),
  Product(
    23,
    'Backpack',
    'assets/images/backpack.png',
    'Durable canvas backpack with multiple compartments for daily use or travel.',
    160,
  ),
  Product(
    24,
    'Formal Shoes',
    'assets/images/formal_shoes.png',
    'Polished leather formal shoes designed for office and formal events. Classic lace-up style.',
    190,
  ),
  Product(
    25,
    'Polo Shirt',
    'assets/images/polo_shirt.png',
    'Comfortable polo shirt with ribbed collar and breathable fabric. Perfect for smart-casual looks.',
    85,
  ),
  Product(
    26,
    'Jogger Pants',
    'assets/images/jogger_pants.png',
    'Slim-fit joggers with elastic cuffs and drawstring waist. Ideal for workouts or lounging.',
    100,
  ),
  Product(
    27,
    'Wristband',
    'assets/images/wristband.png',
    'Minimalistic leather wristband accessory that adds subtle style to your outfit.',
    40,
  ),
  Product(
    28,
    'Plaid Shirt',
    'assets/images/plaid_shirt.png',
    'Classic plaid button-up shirt made from soft flannel. Perfect for layering in cooler weather.',
    115,
  ),
  Product(
    29,
    'Rain Jacket',
    'assets/images/rain_jacket.png',
    'Water-resistant jacket with zip closure and adjustable hood. Lightweight and practical.',
    220,
  ),
  Product(
    30,
    'Ankle Socks',
    'assets/images/ankle_socks.png',
    'Set of soft cotton ankle socks for daily comfort. Breathable and stretchable fit.',
    25,
  ),
  Product(
    31,
    'Gray Hoodie',
    'assets/images/gray_hoodie.png',
    'Classic gray hoodie with kangaroo pocket. Soft fleece lining for maximum comfort.',
    95,
  ),
  Product(
    32,
    'White Shirt',
    'assets/images/white_shirt.png',
    'Crisp white button-down shirt made from premium cotton. Suitable for both formal and casual wear.',
    130,
  ),
  Product(
    33,
    'Leather Wallet',
    'assets/images/leather_wallet.png',
    'Compact brown leather wallet with multiple card slots and a coin pocket.',
    80,
  ),
  Product(
    34,
    'Beanie Hat',
    'assets/images/beanie_hat.png',
    'Warm knitted beanie hat designed to keep you cozy in winter. Stretchable and soft.',
    55,
  ),
  Product(
    35,
    'Tank Top',
    'assets/images/tank_top.png',
    'Lightweight cotton tank top for summer wear or gym sessions.',
    45,
  ),
  Product(
    36,
    'Trench Coat',
    'assets/images/trench_coat.png',
    'Classic beige trench coat with belt and button closure. Elegant and weather-resistant.',
    280,
  ),
  Product(
    37,
    'Cargo Pants',
    'assets/images/cargo_pants.png',
    'Comfortable cargo pants with multiple pockets and durable stitching.',
    130,
  ),
  Product(
    38,
    'Sports Cap',
    'assets/images/sports_cap.png',
    'Breathable mesh sports cap ideal for outdoor activities.',
    40,
  ),
  Product(
    39,
    'Wrist Watch',
    'assets/images/wrist_watch.png',
    'Analog wristwatch with stainless steel body and leather strap. Minimalist and stylish.',
    175,
  ),
  Product(
    40,
    'Graphic Hoodie',
    'assets/images/graphic_hoodie.png',
    'Trendy hoodie featuring a bold front graphic design. Made from premium fleece.',
    110,
  ),
  Product(
    41,
    'Denim Skirt',
    'assets/images/denim_skirt.png',
    'Casual blue denim skirt with front buttons and side pockets. A summer essential.',
    90,
  ),
  Product(
    42,
    'Running Shorts',
    'assets/images/running_shorts.png',
    'Breathable running shorts with reflective detailing for night runs.',
    75,
  ),
  Product(
    43,
    'Wool Scarf',
    'assets/images/wool_scarf.png',
    'Soft wool scarf designed to provide warmth and add elegance to your winter outfit.',
    60,
  ),
  Product(
    44,
    'Training Gloves',
    'assets/images/training_gloves.png',
    'Durable grip-enhancing gloves ideal for gym and outdoor workouts.',
    55,
  ),
  Product(
    45,
    'High Heels',
    'assets/images/high_heels.png',
    'Elegant high heels crafted for comfort and sophistication. Perfect for formal events.',
    220,
  ),
  Product(
    46,
    'Sweatpants',
    'assets/images/sweatpants.png',
    'Soft cotton sweatpants with elastic waistband and tapered fit.',
    100,
  ),
  Product(
    47,
    'Leather Handbag',
    'assets/images/leather_handbag.png',
    'Stylish leather handbag with metal accents and adjustable strap.',
    250,
  ),
  Product(
    48,
    'Denim Shorts',
    'assets/images/denim_shorts.png',
    'Casual light-wash denim shorts with frayed edges for a relaxed summer vibe.',
    85,
  ),
  Product(
    49,
    'Sports Bra',
    'assets/images/sports_bra.png',
    'Supportive sports bra made with moisture-wicking fabric for active comfort.',
    70,
  ),
  Product(
    50,
    'Puffer Jacket',
    'assets/images/puffer_jacket.png',
    'Insulated puffer jacket designed for maximum warmth during cold seasons.',
    320,
  ),
  Product(
    51,
    'Slip-On Shoes',
    'assets/images/slip_on_shoes.png',
    'Easy-to-wear slip-on shoes with cushioned soles and breathable upper.',
    110,
  ),
  Product(
    52,
    'Canvas Tote Bag',
    'assets/images/canvas_tote_bag.png',
    'Eco-friendly canvas tote bag perfect for shopping or daily errands.',
    65,
  ),
  Product(
    53,
    'Floral Dress',
    'assets/images/floral_dress.png',
    'Beautiful floral print dress made from light, flowy fabric. Great for spring and summer.',
    150,
  ),
  Product(
    54,
    'Wrist Sweatband',
    'assets/images/wrist_sweatband.png',
    'Soft absorbent wrist sweatband ideal for workouts or sports activities.',
    30,
  ),
  Product(
    55,
    'Track Jacket',
    'assets/images/track_jacket.png',
    'Lightweight zip-up track jacket made with moisture-wicking polyester.',
    130,
  ),
];

final productsProvider = Provider<List<Product>>((ref) {
  return allProducts;
});

final selectedProductProvider = StateProvider<Product?>((ref) => null);

final liveSelectedProductProvider = Provider<Product?>((ref) {
  final selected = ref.watch(selectedProductProvider);
  final products = ref.watch(productNotifierProvider);

  if (selected == null) return null;

  return products.firstWhere(
    (p) => p.productId == selected.productId,
    orElse: () => selected,
  );
});

// notifier
class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super(allProducts);

  List<Product> search(String name) {
    if (name.isEmpty) {
      return state;
    }

    return state
        .where((p) => p.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }

  void toggleLike(int productId, WidgetRef ref) {
    state = state.map((product) {
      if (product.productId == productId) {
        final updated = product.copyWith(isLiked: !product.isLiked);

        final wishNotifier = ref.read(wishProvider.notifier);

        if (updated.isLiked) {
          wishNotifier.addProduct(updated);
        } else {
          wishNotifier.removeProduct(updated);
        }

        return updated;
      }
      return product;
    }).toList();
  }
}

// provider
final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
      return ProductNotifier();
    });

final searchedProductsProvider = StateProvider<List<Product>>((ref) => []);
