// Row(
// children: [
// GestureDetector(
// onTap: (){
// setState(() {
// selectIndex = 1;
// });
// },
// child: Container(
// height: 30,
// width: 100,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// border: Border.all(color:selectIndex == 1?Colors.transparent: Colors.grey),
// ),
// child:  Center(
// child: Text('All',style: TextStyle(
// color: selectIndex == 1?Colors.green: Colors.grey
// ),),
// ),
// ),
// ),
// GestureDetector(
// onTap: (){
// setState(() {
// selectIndex = 2;
// });
// },
// child: Container(
// height: 30,
// width: 100,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// border: Border.all(color:selectIndex == 2?Colors.transparent: Colors.grey),
// ),
// child:  Center(
// child: Text('Sale',style: TextStyle(
// color: selectIndex == 1?Colors.green: Colors.grey
// ),),
// ),
// ),
// ),
// GestureDetector(
// onTap: (){
// setState(() {
// selectIndex = 3;
// });
// },
// child: Container(
// height: 30,
// width: 100,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(12),
// border: Border.all(color:selectIndex == 3?Colors.transparent: Colors.grey),
// ),
// child:  Center(
// child: Text('Witdraw',style: TextStyle(
// color: selectIndex == 3?Colors.green: Colors.grey
// ),),
// ),
// ),
// ),
// ],
// ),
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text/constants.dart';

class MySalesTabCard extends StatelessWidget {
  final String imagepath;
  final String maintext;
  final String datetime;
  final String amount;
  final int color;

  const MySalesTabCard({
    super.key,
    required this.imagepath,
    required this.maintext,
    required this.datetime,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 85,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: cardcontainerdecorationradius15,
        child: Row(
crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10,),
            Container(

   height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4.4,
                    offset: const Offset(0,4.4),
                  )
                ],
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Image.asset(
                  imagepath,
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 20,),
                Text(
                  maintext,
                  style: k14B500style,
                ),
                const SizedBox(height: 2,),
                Text(
                  datetime,
                  style: k11_09Grey400style,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                amount,
                style: GoogleFonts.poppins(
                  color: Color(color),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
