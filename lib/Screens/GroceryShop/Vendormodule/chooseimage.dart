import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
class ImageContainer extends StatelessWidget {
  final double width;
  final double heigth;
  final String text;
  final double radius;
  const ImageContainer({super.key, required this.width, required this.heigth, required this.text, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: heigth,
      decoration: BoxDecoration(
        color: const Color(0xffF1FAF4),
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset('images/cam.png',height: 14,width: 17,),
          const SizedBox(height: 5,),
          Text(text,style: k10grey300style,),
        ],
      ),
    );
  }
}
