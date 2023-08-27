import 'package:flutter/Material.dart';

class MyDropDownFormField extends StatefulWidget {
  final String hinttext;
  final List<String> list;
  final bool iscolorchanged;
  const MyDropDownFormField({super.key, required this.hinttext, required this.list, required this.iscolorchanged});

  @override
  State<MyDropDownFormField> createState() => _MyDropDownFormFieldState();
}

class _MyDropDownFormFieldState extends State<MyDropDownFormField> {
  String _selectedItem =''; // Default selected item

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.hinttext;
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
                decoration:  InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                    border: const OutlineInputBorder(
                      // Set Border to InputBorder.none to remove the underline
                      borderSide: BorderSide.none,
                    ),
                    hintText: widget.hinttext,
                    fillColor:widget.iscolorchanged ?const Color(0xffEBF8EE): const Color(0xffF5F8F8),
                    filled: true),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                value: _selectedItem,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue!;
                  });
                },
                items: widget.list.map<DropdownMenuItem<String>>((String value) {
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
