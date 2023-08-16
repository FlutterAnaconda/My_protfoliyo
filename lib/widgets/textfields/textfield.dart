import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatelessWidget {
  final String name;
  bool isreadonly;
  bool obscure;
  final String labelText;
  final TextEditingController controller;
  final Widget? suffixicon;
  TextInputType? mykeyboardType;

  MyTextFormField({
    Key? key,
    required this.name,
    required this.labelText,
    required this.controller,
    this.obscure = false,
    this.isreadonly = false,
    this.suffixicon,
    this.mykeyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        readOnly: isreadonly,
        style: const TextStyle(fontSize: 18.0),
        keyboardType: mykeyboardType,
        obscureText: obscure,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD6D8DA), width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFD6D8DA), width: 1.0),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(color: const Color(0xFFA6A6A6)),
          suffixIcon: suffixicon,
        ),
      ),
    );
  }
}
