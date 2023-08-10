import 'package:flutter/material.dart';

class CartQuantityWidget extends StatelessWidget {
  final int initialquantity;
  final ValueChanged<int> onQuantityChanged;

  const CartQuantityWidget(
      {super.key,
      required this.initialquantity,
      required this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: () {
              if (initialquantity > 0) {
                onQuantityChanged(initialquantity - 1);
              }
            },
            icon: const Icon(Icons.remove, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            initialquantity.toString(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: () {
              onQuantityChanged(initialquantity + 1);
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
