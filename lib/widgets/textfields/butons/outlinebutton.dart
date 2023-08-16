// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Myoutlinebutton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;
//   const Myoutlinebutton({super.key, required this.onTap, required this.text});
//   static const Color _color = Color(0xFF07CD6E);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.7,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(
//                   8.0), // Match the container's border radius
//             ),
//             backgroundColor: Colors.white,
//             side: const BorderSide(
//               width: 1.0,
//               color: _color,
//             )),
//         child: Text(
//           text,
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             color: _color,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Myoutlinebutton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const Myoutlinebutton({super.key, required this.onTap, required this.text});
  static const Color _color = Color(0xFF07CD6E);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: Material(
        color: Colors
            .transparent, // Important: Set the material color to transparent
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          splashColor: _color.withOpacity(0.3), // Customize the splash color
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: _color,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: _color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
