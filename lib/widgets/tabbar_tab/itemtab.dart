import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/GroceryShop/InhomeScreens/orderdetail.dart';
import '../../Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import '../../models/productmodel.dart';

final List<ProductModel> list = [
  ProductModel(
      title: 'zulam',
      image: 'images/Group 7066.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'in_progress'),
  ProductModel(
      title: 'italia',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'pending'),
  ProductModel(
      title: 'norm',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'delivered'),
  ProductModel(
      title: 'pharse',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'in_progress'),
  ProductModel(
      title: 'glue',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'pending'),
  ProductModel(
      title: 'master',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'delivered'),
  ProductModel(
      title: 'shifoo',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'pending'),
  ProductModel(
      title: 'doremon',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'completed'),
  ProductModel(
      title: 'raw material',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'completed'),
  ProductModel(
      title: 'pinki peerni',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'completed'),
  ProductModel(
      title: 'ice soada',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'completed'),
  ProductModel(
      title: 'candyland',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'completed'),
  ProductModel(
      title: 'doremon',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'delivered'),
  ProductModel(
      title: 'pizzahot',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'pending'),
  ProductModel(
      title: 'speicy pizza',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'delivered'),
  ProductModel(
      title: 'cucumber juice',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      status: 'in_progress'),
];

Widget items() {
  // Implement the content for each tab here
  return ListView.builder(
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Set the container background color
            borderRadius: BorderRadius.circular(9), // Optional: Rounded corners
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
            height: 100, // Replace with your desired fixed width
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9)),
                  child: Image.asset(
                    list[index].image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].title!,
                      style: GoogleFonts.poppins(
                        fontSize: 16.03,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff34A853),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
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
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget active() {
  // Implement the content for each tab here
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: list.length,
    itemBuilder: (context, index) {
      Color? labelColor;
      String? labelText;
      // Determine label color and text based on your data
      if (list[index].status == "in_progress") {
        labelColor = const Color(0xFF1FB46D);
        labelText = "In Progress";
      } else if (list[index].status == "pending") {
        labelColor = const Color(0xFFFB3C5E);
        labelText = "Pending";
      } else if (list[index].status == "delivered") {
        labelColor = const Color(0xFFF3743D);
        labelText = "Delivered";
      } else {
        return Container();
      }
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const Orderdetails(),
          ),
        ),
        child: Container(
          decoration: cardcontainerdecoration,
          margin: const EdgeInsets.all(8),
          child: SizedBox(
            height: 125, // Replace with your desired fixed width
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 27,
                            left: 23,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9)),
                            child: Image.asset(
                              list[index].image!,
                              height: 60,
                              width: 60,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Order Number',
                                style: k14_79B400style,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '#264100',
                                style: k12_94G400style,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Color(0xffD6CCC6),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '09th Jan, 2023 -- 11:20AM',
                              style: k12Grey400style,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: 83, // Width of the label container
                  height: 25, // Height of the label container
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: labelColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(9),
                      bottomLeft: Radius.circular(9),
                    ),
                  ),
                  child: Text(labelText, style: k11_09w400style),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget completed() {
  // Implement the content for each tab here
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: list.length,
    itemBuilder: (context, index) {
      if (list[index].status != 'completed') {
        return Container();
      }
      return GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const Orderdetails(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            decoration: cardcontainerdecoration,
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              height: 125, // Replace with your desired fixed width
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 27,
                              left: 23,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(9),
                                  topRight: Radius.circular(9)),
                              child: Image.asset(
                                list[index].image!,
                                height: 60,
                                width: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'Order Number',
                                    style: k14_79B400style,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '#264100',
                                    style: k12_94G400style,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'Completed',
                                    style: k11_09red500style,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 23.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Color(0xffD6CCC6),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '09th Jan, 2023 -- 11:20AM',
                                style: k12Grey400style,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff07CD6E),
                            const Color(0xff059F55).withOpacity(0.86),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 20,
                        weight: 1,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
