import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mysubscribebutton extends StatefulWidget {
  final VoidCallback ontap;
  final bool isTapped;

  const Mysubscribebutton({super.key, required this.ontap, required this.isTapped});

  @override
  _MysubscribebuttonState createState() => _MysubscribebuttonState();
}

class _MysubscribebuttonState extends State<Mysubscribebutton> {




  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: GestureDetector(
          onTap: widget.ontap,
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 32,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: widget.isTapped ? null : Colors.white,
              gradient: widget.isTapped ? LinearGradient(
                colors: [
                  const Color(0xff07CD6E),
                  const Color(0xFF059F55).withOpacity(0.86),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ):null,
              border: widget.isTapped ?null:Border.all(color: const Color(0xff07CD6E),),
            ),
            child: Text(
              'Subscribe',
              style: GoogleFonts.poppins(
                color: widget.isTapped ? Colors.white : const Color(0xFF059F55),
                fontWeight: FontWeight.w500,
                fontSize: 12
              ),
            ),
          ),
        ),
      );

  }
}



class Mytrialbutton extends StatefulWidget {
  final VoidCallback ontap;
  final bool isTapped;
  final String text;

  const Mytrialbutton({super.key, required this.ontap, required this.isTapped, required this.text});

  @override
  _MytrialbuttonState createState() => _MytrialbuttonState();
}

class _MytrialbuttonState extends State<Mytrialbutton> {




  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: widget.ontap,
        child: Container(

          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width*0.9,
          height: 64,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: widget.isTapped ?  const Color(0xffF0F9F2):Colors.white ,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05), // Shadow color
                spreadRadius: 0, // Spread radius (controls the blur)
                blurRadius: 2, // Blur radius
                offset: const Offset(0, 2), // Offset in the x and y axes
              ),
            ],
            border: widget.isTapped ?Border.all(color: const Color(0xff07CD6E)):null,
          ),

          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
                color: widget.isTapped ? const Color(0xFF059F55):const Color(0xff8C8E97),
                fontWeight: FontWeight.w500,
                fontSize: 12
            ),
          ),
        ),
      );

  }
}