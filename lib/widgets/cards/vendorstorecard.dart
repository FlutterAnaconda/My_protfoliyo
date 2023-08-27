import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
class VendorStore extends StatelessWidget {
  final String text;
  final String amount;
  const VendorStore({super.key, required this.text, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 163,
      decoration: BoxDecoration(
        color: const Color(0xffEFF9F2),
        borderRadius: BorderRadius.circular(22),
      ),
      child:  Row(

        children: [
          const SizedBox(width: 8,),
          Material(
            elevation: 1,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Image.asset(
                'images/cube.png',
                scale: 3.5,
                // fit: BoxFit.fill,
              ), // Replace with your image
            ),
          ),
          const SizedBox(width: 8,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
            Text(text,style: k12B400style,),
            const SizedBox(height: 3,),
            Text(amount,style: k14G600style,),
          ],)
        ],
      ),
    );
  }
}
