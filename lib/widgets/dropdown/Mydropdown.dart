import 'package:flutter/Material.dart';

class MyDropDownFormField extends StatefulWidget {
  const MyDropDownFormField({super.key});

  @override
  State<MyDropDownFormField> createState() => _MyDropDownFormFieldState();
}

class _MyDropDownFormFieldState extends State<MyDropDownFormField> {
  String _selectedItem = 'Delivery'; // Default selected item
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: DropdownButtonFormField<String>(
                icon: Padding(
                  padding: const EdgeInsets.only(right:16.0),
                  child: Image.asset('images/arrow3.png',height: 6,width: 12,),
                ),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                    border: OutlineInputBorder(
                      // Set Border to InputBorder.none to remove the underline
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Delivery',
                    fillColor: Color(0xffF5F8F8),
                    filled: true),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
