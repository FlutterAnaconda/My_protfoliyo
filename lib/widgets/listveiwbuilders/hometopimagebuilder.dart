import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imagepath = [
    'images/displayimage2.png',
    'images/displayimage2.png',
    'images/displayimage2.png',
    'images/displayimage2.png',
    'images/displayimage2.png', // Replace with your image URLs
    // Replace with your image URLs
    // Add more image URLs here if needed
  ];

  ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        // viewportFraction: 0.9,
        height: 150,
        // Adjust the height as needed
        // autoPlay: true, // Enable auto-play
        // enlargeCenterPage: true,
        aspectRatio: 1,
        // autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        // pauseAutoPlayOnTouch: true,
      ),
      items: imagepath.map((imagepath) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 5),
              child: Image.asset(
                imagepath,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.contain,

              ),
            );
          },
        );
      }).toList(),
    );
    // return SizedBox(
    //   height: 200,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: imagepath.length,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.only(left: 8.0),
    //         child: Image.asset(
    //           imagepath[index],
    //           width: 350,
    //           fit: BoxFit.contain,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
