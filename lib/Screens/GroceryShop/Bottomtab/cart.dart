import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Providers/cartprovider.dart';
import '../../../models/cart_item.dart';

import '../../../widgets/customappbar.dart';
import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/butons/whiteTextButton.dart';
import '../InhomeScreens/checkoutscreen.dart';
import '../homeScreen.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<CartItem> cartItems = cartProvider.cartItems;

    return Scaffold(
      backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: 'Cart',
        onpressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen())),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  CartItem item = cartItems[index];

                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          width: 100,
                          height: 110,
                          child: const Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    onDismissed: (_) {
                      cartProvider.removeFromCart(item);

                      Fluttertoast.showToast(
                        msg: "Item removed from cart!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 18),
                      child: Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors
                              .white, // Set the container background color
                          borderRadius: BorderRadius.circular(
                              9), // Optional: Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.1), // Shadow color
                              spreadRadius:
                                  0, // Spread radius (controls the blur)
                              blurRadius: 3.5630252361297607, // Blur radius
                              offset: const Offset(0,
                                  1.7815126180648804), // Offset in the x and y axes
                            ),
                          ],
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: k16B600style,
                                    ),
                                    Text(
                                      item.title,
                                      style: k14Grey500style,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '\$${item.price}',
                                            style: k16G600style,
                                          ),
                                          const SizedBox(
                                            width: 110,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              cartProvider
                                                  .decrementQuantity(item);
                                              Fluttertoast.showToast(
                                                msg: "Item quantity decreased!",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                textColor: Colors.white,
                                                fontSize: 14.0,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 25,
                                              color: Color(0xff6D3805),
                                            ),
                                          ),
                                          Text(
                                            '${item.quantity}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff6D3805),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              cartProvider
                                                  .incrementQuantity(item);
                                              Fluttertoast.showToast(
                                                msg: "Item quantity increased!",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              size: 25,
                                              color: Color(0xff6D3805),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            Positioned(
                              right: 65,
                              bottom: 50,
                              child: item.image.contains('http')
                                  ? Image.network(
                                      item.image,
                                      fit: BoxFit.contain,
                                      height: 95,
                                    )
                                  : Image.asset(
                                      item.image,
                                      fit: BoxFit.contain,
                                      height: 95,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 160,
              child: Card(
                surfaceTintColor: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, color: Colors.black45),
                            ),
                            const Spacer(),
                            Text(
                                '\$${cartProvider.calculateTotalPrice(cartItems).toStringAsFixed(2)}',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.black45)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" Delivery free for 3.6km",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                            const Spacer(),
                            Text("data",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Center(
                              child: buildButton(context, () {
                            if (cartProvider.calculateTotalPrice(cartItems) >
                                0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CheckOutScreen(
                                            total: cartProvider
                                                .calculateTotalPrice(cartItems),
                                          )));
                            } else {
                              Fluttertoast.showToast(
                                msg: 'please Select items',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          }, 'CheckOut')),
                        ),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
