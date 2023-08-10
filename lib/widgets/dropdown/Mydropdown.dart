import 'package:flutter/Material.dart';

class MyDropDownFormField extends StatefulWidget {
  const MyDropDownFormField({super.key});

  @override
  State<MyDropDownFormField> createState() => _MyDropDownFormFieldState();
}

class _MyDropDownFormFieldState extends State<MyDropDownFormField> {
  String _selectedItem = 'Delivery'; // Default selected item

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: DropdownButtonFormField<String>(
        iconSize: 35,
        iconDisabledColor: Colors.grey,
        iconEnabledColor: Colors.black45,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            border: const OutlineInputBorder(
              // Set Border to InputBorder.none to remove the underline
              borderSide: BorderSide.none,
            ),
            hintText: 'Delivery',
            fillColor: Colors.green.withOpacity(0.12),
            filled: true),
        borderRadius: BorderRadius.circular(20),
        value: _selectedItem,
        onChanged: (String? newValue) {
          setState(() {
            _selectedItem = newValue!;
          });
        },
        items: <String>[
          'Delivery',
          'Item 2',
          'Item 3',
          'Item 4',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value, // Ensure that each item has a unique value
            child: Text(
              value,
              style: const TextStyle(color: Colors.grey),
            ),
          );
        }).toList(),
      ),
    );
  }
}
