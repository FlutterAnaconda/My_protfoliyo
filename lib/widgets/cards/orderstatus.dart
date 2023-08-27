import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/productmodel.dart';

class OrderStatus extends StatelessWidget {
  OrderStatus({super.key});
  final List<ProductModel> list = [
    ProductModel(image: 'images/pending.png', title: 'Pending', price: 03),
    ProductModel(image: 'images/conform.png', title: 'Confirmed', price: 05),
    ProductModel(image: 'images/progress.png', title: 'In Progress', price: 13),
    ProductModel(
        image: 'images/outdev.png', title: 'Out of Delivery', price: 21),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
            child: Container(
              height: 80,
              width: 342,
              decoration: cardcontainerdecorationradius15,
              child: Row(

                children: [
                  const SizedBox(width: 10,),
                  Material(
                    elevation: 1,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Image.asset(
                        list[index].image!,
                        scale: 3.5,
                        // fit: BoxFit.fill,
                      ), // Replace with your image
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].title!,
                        style: k14B600style,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Order',
                        style: k12_94G400style,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Text(
                      list[index].price!.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: list[index].title == 'Pending'
                            ? const Color(0xff0796C2)
                            : list[index].title == 'Confirmed'
                                ? const Color(0xff34A853)
                                : list[index].title == 'In Progress'
                                    ? const Color(0xffFF7300)
                                    : const Color(0xffB62D2D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
