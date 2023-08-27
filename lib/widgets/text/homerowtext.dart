import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myhomerowtext extends StatelessWidget {
  final String text;
  final VoidCallback? ontap;
  const Myhomerowtext({super.key, required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          TextButton(
            onPressed: ontap,
            child: Text(
              'View all',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: const Color(0xff34A853),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Vendorhomerowtext extends StatelessWidget {
  final String righttext;
  final String lefttext;
  final VoidCallback? ontap;
  const Vendorhomerowtext({super.key,  this.ontap, required this.righttext, required this.lefttext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            righttext,
            style:
            GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: ontap,
            child: Text(
              lefttext,
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: const Color(0xff34A853),
              ),
            ),
          )
        ],
      ),
    );
  }
}