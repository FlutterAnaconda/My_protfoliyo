import 'package:flutter/material.dart';

import '../../../widgets/customappbar.dart';

import '../../../widgets/rating.dart';
import '../../../widgets/textfields/Descriptiontextfeild.dart';
import '../../../widgets/textfields/butons/whiteTextButton.dart';

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
            width: 300,
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 2,
              child: ListTile(
                leading: image.contains('http')
                    ? Image.network(
                        image,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        image,
                        fit: BoxFit.fill,
                        // height: 100,
                      ),
                title: Text(title),
                subtitle: Text(
                  'Price: \$$price',
                  style: const TextStyle(fontSize: 14),
                ),
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
          buildButton(context, () {
            Navigator.pop(context);
          }, 'Submit'),
        ],
      ),
    );
  }
}
