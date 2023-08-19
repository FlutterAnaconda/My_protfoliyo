import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/AddreviewScreen.dart';
import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/reviewScreen.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Providers/cartprovider.dart';
import '../../../models/cart_item.dart';
import '../../../widgets/cartQuantity.dart';
import '../../../widgets/customappbar.dart';
import '../../../widgets/listveiwbuilders/Reviewlistveiw.dart';
import '../../../widgets/text/constants.dart';
import '../../../widgets/text/homerowtext.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routename = '/ProductDetailsScreen';
  final String title;
  final String image;
  final int price;
  final String location;
  const ProductDetailsScreen({
    super.key,
    required this.image,
    required this.location,
    required this.price,
    required this.title,
  });
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isAssetimage = true;
  bool isfav = false;

  void addToCart() {
    if (cartQuantity > 0) {
      CartItem newItem = CartItem(
        title: widget.title,
        image: widget.image,
        price: widget.price,
        quantity: cartQuantity,
      );
      final cartProvider = Provider.of<CartProvider>(context, listen: false);
      cartProvider.addToCart(newItem);

      // Set the cartQuantity to 0 in the parent widget to clear the text.
      setState(() {
        cartQuantity = 0;
      });
    } else {
      Fluttertoast.showToast(
        msg: "Quantity should be at least 1",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  void initState() {
    if (widget.image.contains('https')) {
      setState(() {
        isAssetimage = false;
      });
    }
    super.initState();
  }

  int cartQuantity = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: MYDetailsappbar(
              text: 'Product Details', onpressed: () => Navigator.pop(context)),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 310,
                      // decoration: BoxDecoration(
                      //   color: Colors.white, // Set the container background color
                      //   // borderRadius: BorderRadius.circular(34),
                      //   border: Border.all(
                      //       width: 0.5,
                      //       color: Colors.black
                      //           .withOpacity(0.05)), // Optional: Rounded corners
                      //
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.black.withOpacity(0.1), // Shadow color
                      //       spreadRadius: 0, // Spread radius (controls the blur)
                      //       blurRadius: 2.84415602684021, // Blur radius
                      //       offset:
                      //           const Offset(0, 2), // Offset in the x and y axes
                      //     ),
                      //   ],
                      // ),
                      child: Stack(
                        children: [
                          // Image Widget
                          isAssetimage
                              ? Image.asset(
                                  widget.image,
                                  width: double.infinity,
                                  height: 300,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.image,
                                  width: double.infinity,
                                  height: 270,
                                  fit: BoxFit.fill,
                                ),
                          // Cart Quantity Control
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: CartQuantityWidget(
                              initialquantity: cartQuantity,
                              onQuantityChanged: (newQuantity) {
                                setState(() {
                                  cartQuantity = newQuantity;
                                });
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isfav = !isfav;
                                  // Toggle favorite state
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Image.asset(
                                  isfav
                                      ? 'images/fillheart.png'
                                      : 'images/heart.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.05),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            ' ${widget.title}',
                            style: k22B600style,
                          ),
                          const Spacer(),
                          Text(
                            ' \$${widget.price.toStringAsFixed(1)}',
                            style: k20B600style,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                            size: 17.8,
                          ),
                          Text(
                            widget.location,
                            style: k12_4B_49_400style,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: buildMinorDetail(
                                '45minutes',
                                Icons.bike_scooter,
                                Colors.orangeAccent,
                                context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: buildMinorDetail('80 kcal,100 gm',
                                Icons.water_drop, Colors.green, context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: buildMinorDetail('80 kcal,100 gm',
                                Icons.water_drop, Colors.green, context),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddReviewScreen(
                                      image: widget.image,
                                      price: widget.price,
                                      title: widget.title,
                                    ))),
                        child: Text(
                          'AddReview',
                          style: k10G400style,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 18.0),
                    //   child: TextButton(
                    //     onPressed: () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (_) => const FavoritesScreen(),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       'See All favorite',
                    //       style: k10G400style,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Description',
                        style: k16B500style,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lorem ipsum dolor sit amet, Lorem ipsum dolor\n sit amet, consectetur adipiscing elit.consectetur \nadipiscing ',
                        style: k14Grey500style,
                      ),
                    ),
                    Myhomerowtext(
                        text: 'Reviews',
                        ontap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ReviewsBuilderScreen()))),
                    const ReviewsBuilder(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0),
            child: GradientElevatedButton(
              onPressed: () {
                addToCart();
              },
              text: 'Add to Cart',
            ),
          )),
    );
  }
}

Widget buildMinorDetail(
    String text, IconData myicon, Color mycolor, BuildContext context) {
  final mediaqurey = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color.fromARGB(240, 230, 239, 245),
      ),
      height: mediaqurey.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Icon(
                myicon,
                color: mycolor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                    fontSize: 11, color: const Color(0xff958F8F)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
