import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
class SalesCard extends StatelessWidget {
  final String  centertext;
  final String  amount;
  final String  image;

  const SalesCard({super.key, required this.centertext, required this.amount, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 159.02,
      width: 163.35,
      decoration: salecardcontainerdecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(radius: 30,backgroundColor: Colors.white,child: Image.asset(image,width: 32,height: 30,fit: BoxFit.cover,),),
            Text(centertext,style: k14B500style,),
          Text(amount,style:k16G600style ,),
        ],
      ),
    );
  }
}
