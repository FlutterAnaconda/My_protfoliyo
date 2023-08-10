class CartItem {
  final String title;
  final String image;
  final int price;
  int quantity; // Make quantity non-final

  CartItem({
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
  });

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // void clearcart() {
  //   quantity = 0;
  // }
}
