class Product {
  int productId;
  String name;
  String image;
  String desc;
  double price;
  bool inStock;
  int quantity;
  bool isLiked;

  Product(
    this.productId,
    this.name,
    this.image,
    this.desc,
    this.price, {
    this.inStock = true,
    this.quantity = 1,
    this.isLiked = false,
  });

  double get totalPrice => price * quantity;
  Product copyWith({bool? isLiked}) {
    return Product(
      productId,
      name,
      image,
      desc,
      price,
      quantity: quantity,
      inStock: inStock,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
