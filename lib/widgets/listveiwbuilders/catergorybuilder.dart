import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatergoryBuilder extends StatelessWidget {
  final List<String> imagepath = [
    'images/catergoryimages/g4.png',
    'images/catergoryimages/g3.png',
    'images/catergoryimages/g2.png',
    'images/catergoryimages/g1.png',
    'images/catergoryimages/g4.png',
    'images/catergoryimages/g3.png',
    'images/catergoryimages/g2.png',
    'images/catergoryimages/g1.png',
    'images/catergoryimages/g4.png',
    'images/catergoryimages/g3.png',
    'images/catergoryimages/g2.png',
    'images/catergoryimages/g1.png',
  ];

  CatergoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: SizedBox(
        height: 72,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagepath.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: const Color(0xff51BC7D).withOpacity(0.20),
                    ),
                    height: 49,
                    width: 48,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(imagepath[index]),
                        // Adjust the height of the images as needed
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, top: 5.0),
                  child: Text(
                    "data",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xff636464),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
