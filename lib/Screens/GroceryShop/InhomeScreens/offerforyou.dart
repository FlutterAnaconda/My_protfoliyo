import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import 'package:dotcoder1/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/customappbar.dart';

// ignore: must_be_immutable
class OfferListScreen extends StatelessWidget {
  static const String routename = '/OfferListScreen';
  List<ProductModel> list = [
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 7066.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'zapiata',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'carbs',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'tamatar',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    )
  ];

  OfferListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MYDetailsappbar(
        text: 'Offers For You',
        onpressed: () => Navigator.pop(context),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                          image: list[index].image!,
                          location: list[index].location!,
                          price: list[index].price!,
                          title: list[index].title!,
                        ))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Set the container background color
                  borderRadius:
                      BorderRadius.circular(9), // Optional: Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      spreadRadius: 0, // Spread radius (controls the blur)
                      blurRadius: 3.5630252361297607, // Blur radius
                      offset: const Offset(
                          0, 1.7815126180648804), // Offset in the x and y axes
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(8),
                child: SizedBox(
                  // width: 200,
                  height: 100, // Replace with your desired fixed width
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9)),
                        child: Image.asset(
                          list[index].image!,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  list[index].title!,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16.03,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff34A853),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Image.asset('images/star1.png',width: 14.25,height:  14.25,),
                                ),
                                Text(
                                  list[index].rating!.toStringAsFixed(1),
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, fontWeight: FontWeight.w400
                                      // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.black45, size: 16),
                                Text(
                                  list[index].location!,
                                  style: const TextStyle(
                                      fontSize: 12.47,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
