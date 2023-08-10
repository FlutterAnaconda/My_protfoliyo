// Import the necessary packages at the beginning of your Dart file
import 'package:flutter/material.dart';

import '../../../widgets/customappbar.dart';

class AllCategory extends StatelessWidget {
  static const String routename = '/AllCategory';
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

  AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: 'All Categories',
        onpressed: () => Navigator.pop(context),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: imagepath.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    color: const Color(0xff51BC7D).withOpacity(0.20),
                  ),
                  height: 70,
                  width: 70,
                  child: Center(
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
                const Text("data"),
              ],
            ),
          );
        },
      ),
    );
  }
}
