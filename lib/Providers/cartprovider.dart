import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    // Check if item already exists in cart
    bool itemExists = false;
    for (var cartItem in _cartItems) {
      if (cartItem.title == item.title) {
        cartItem.incrementQuantity();
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      _cartItems.add(item);
    }

    Fluttertoast.showToast(
      msg: "Item added to cart!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: const Color(0xFF07CD6E),
      textColor: Colors.white,
    );
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    item.incrementQuantity();
    notifyListeners();
  }

  void decrementQuantity(CartItem item) {
    item.decrementQuantity();
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    // Fluttertoast.showToast(
    //   msg: "Item removed from cart!",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   backgroundColor: Colors.red,
    //   textColor: Colors.white,
    // );
    notifyListeners();
  }

  double calculateTotalPrice(List<CartItem> cartItems) {
    double totalamount = 0;
    for (CartItem item in cartItems) {
      totalamount += (item.price * item.quantity);
    }

    return totalamount;
  }
}
