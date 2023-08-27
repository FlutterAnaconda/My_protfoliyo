import 'package:dotcoder1/widgets/cards/salescard.dart';
import 'package:dotcoder1/widgets/text/homerowtext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/cards/orderstatus.dart';
import '../../../../widgets/cards/vendorstorecard.dart';
import 'customchart.dart';
class VHometab extends StatefulWidget {
  const VHometab({super.key});

  @override
  State<VHometab> createState() => _VHometabState();
}

class _VHometabState extends State<VHometab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        // Add your logic here for the first icon onTap event.
                      },
                      child: const Image(
                        image: AssetImage('images/menu-bar 1.png',),
                        width: 25,
                        height: 24,
                      ),
                    ),
                  ),

                  Text(
                    'Store App',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:4.0),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => const CartScreen(cartItems: [],),));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Image(
                          image: AssetImage('images/bell.png'),
                          height: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 215,width: MediaQuery.of(context).size.width,child: BarChartSample2()),

              const Vendorhomerowtext(righttext: 'Sales', lefttext: 'Show more'),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                SalesCard(centertext: 'Today\'s', amount: '\$35', image: 'images/sale1.png'),
                SalesCard(centertext: 'Al Sales', amount: '\$350', image: 'images/sale2.png')
              ],),
              const SizedBox(height: 10,),
              const Vendorhomerowtext(righttext: 'Orders', lefttext: 'View Details'),

              OrderStatus(),
              const SizedBox(height: 10,),
              const Vendorhomerowtext(righttext: 'Stores', lefttext: 'View Details'),
              const SizedBox(height: 10,),
              const Row(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VendorStore(text: 'Categories',amount: '14',),
                  SizedBox(width: 10,),
                  VendorStore(text: 'Products',amount: '56',),
                ],
              ),
              const SizedBox(height: 10,),


            ],
          ),
        ),
      ),
    );
  }
}
