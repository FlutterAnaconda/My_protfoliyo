import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Thintext extends StatelessWidget {
  final  String text;
  const Thintext({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,style:  GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),);
  }
}
