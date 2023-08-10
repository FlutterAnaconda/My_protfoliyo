import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        readOnly: true, // Make the field read-only
        initialValue: description, // Set the description text
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        maxLines: null, // Allow the text to wrap to multiple lines
        decoration: InputDecoration(
          labelText: 'Description', // Set the label text
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.transparent, // Fill color for the background
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
