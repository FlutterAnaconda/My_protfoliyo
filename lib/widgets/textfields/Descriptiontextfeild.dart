import 'package:flutter/Material.dart';

import '../text/constants.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        // readOnly: true,
        initialValue: description,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        maxLines: null,
        decoration: InputDecoration(
          labelText: 'Description',
          labelStyle: k14Grey500style,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: Color(0xffD6D8DA), // Your desired border color
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: Color(0xffD6D8DA), // Your desired border color
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
