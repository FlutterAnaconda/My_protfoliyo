import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLoginWithButton extends StatelessWidget {
  final String iconUrl;
  final VoidCallback onTap;
  final String text;

  const MyLoginWithButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.iconUrl});
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return SizedBox(
        width: 231,
        height: 51,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Color(0xFFD6D8DA), width: 0.3),
            ),
            padding: const EdgeInsets.all(16.0),
            elevation: 1.0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          child: SizedBox(
            width: mediaquery.width,
            child: Row(
              children: [
                // Add your prefix icon here
                SizedBox(height: 24, width: 24, child: Image.asset(iconUrl)),
                const SizedBox(
                    width: 4.0), // Adjust the spacing between icon and text
                Text(
                  text,
                  // Replace this with your desired button text
                  style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ));
  }
}
