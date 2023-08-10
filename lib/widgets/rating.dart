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
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Your Overall rating of this product'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.grey[350],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
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
