import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import '../../models/productmodel.dart';

// ignore: must_be_immutable
class NewarrivalListview extends StatelessWidget {
  List<ProductModel> list = [
    ProductModel(
      title: 'zulam',
      image: 'images/image17.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'italia',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'norm',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'pharse',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    )
  ];
  NewarrivalListview({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
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
                width: 212, // Replace with your desired fixed width
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(9),
                          topRight: Radius.circular(9)),
                      child: Image.asset(
                        list[index].image!,
                        height: 160,
                        width: 211,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              list[index].title!,
                              style: GoogleFonts.poppins(
                                fontSize: 16.03,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff34A853),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Image.asset('images/star1.png',width: 14.25,height:  14.25,),
                          const SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              list[index].rating!.toStringAsFixed(1),
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.w400
                                  // fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(Icons.location_on,
                                color: Colors.black45, size: 16),
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            list[index].location!,
                            style: const TextStyle(
                                fontSize: 12.47,
                                color: Colors.black45,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Text(
                        '\$${list[index].price!.toStringAsFixed(1)}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
