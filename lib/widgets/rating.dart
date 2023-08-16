import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingCard extends StatefulWidget {
  const RatingCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RatingCardState createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
      child: Container(
        decoration: cardcontainerdecoration,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Your Overall rating of this product'),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                color: Color(0xffEBEBF0),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: RatingBar.builder(
                  unratedColor: const Color(0xffEBEBEB),
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Image.asset( 'images/star3.png',height: 24,width: 24,color: const Color(0xffFFF743),),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
