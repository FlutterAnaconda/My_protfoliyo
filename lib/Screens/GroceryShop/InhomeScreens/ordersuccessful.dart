import 'package:dotcoder1/Screens/GroceryShop/Bottomtab/hometab.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/constants.dart';

class OrderScuccessfull extends StatelessWidget {
  const OrderScuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 40,),
            Image.asset('images/orderdone.png',height: 199,width:223 ,),
            const SizedBox(height: 40,),
            Text(
              'You place the Order\n      Successfully',
              style: k22B500style,
            ),
            const SizedBox(height:25),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Your order is placed nicely. We start\n   our delivery process and you will\n        receive your item soon',
                style: k14Grey300style,
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: GradientElevatedButton(
                text: 'Back To Home',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (c) => const HomeTab()),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
