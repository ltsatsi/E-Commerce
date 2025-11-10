class Product {
  int productId;
  String name;
  String image;
  String desc;
  double price;
  bool inStock;
  int quantity;

  Product(
    this.productId,
    this.name,
    this.image,
    this.desc,
    this.price, {
    this.inStock = true,
    this.quantity = 1,
  });
}
