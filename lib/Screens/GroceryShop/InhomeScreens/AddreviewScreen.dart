import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/customappbar.dart';

import '../../../widgets/rating.dart';
import '../../../widgets/textfields/Descriptiontextfeild.dart';


class AddReviewScreen extends StatelessWidget {
  final String title;
  final String image;
  final int price;

  const AddReviewScreen({
    super.key,
    required this.title,
    required this.image,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: 'Add Review',
        onpressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90,
            width: 300,
            child: Container(
              decoration: cardcontainerdecoration,
              child: Row(
                children: [
                  image.contains('http')
                      ? Image.network(
                          image,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          image,
                          fit: BoxFit.fill,
                          // height: 100,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left:16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:MainAxisAlignment.spaceAround ,
                      children: [

                        Text(title,style: k16G600style,),
                        Row(
                          children: [
                            Image.asset('images/star1.png',width: 14.25,height:  14.25,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                '5.0',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$${price.toStringAsFixed(1)}',
                          style: k14B600style,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const RatingCard(),
          SizedBox(
            height: mediaquery.height * 0.03,
          ),
          const DescriptionWidget(
            description:
                'Lorem ipsum dolor sit amet, Lorem ipsum\n dolor sit amet, consectetur \nadipiscing elit.consectetur adipiscing ',
          ),
          SizedBox(
            height: mediaquery.height * 0.01,
          ),
          GradientElevatedButton(text: 'Submit',onPressed:  () {
            Navigator.pop(context);
          }, ),
        ],
      ),
    );
  }
}
