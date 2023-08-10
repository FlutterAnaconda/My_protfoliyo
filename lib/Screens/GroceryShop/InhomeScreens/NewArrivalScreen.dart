import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import 'package:flutter/material.dart';

import '../../../models/productmodel.dart';
import '../../../widgets/customappbar.dart';

// ignore: must_be_immutable
class NewarrivalListScreen extends StatelessWidget {
  static const String routename = '/NewarrivalListview';
  List<ProductModel> list = [
    ProductModel(
      title: 'zulam',
      image: 'images/Group 7066.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'italia',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'norm',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'pharse',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    )
  ];
  NewarrivalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MYDetailsappbar(
        text: 'New Arrivals',
        onpressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: SizedBox(
          height: mediaquery.height,
          width: mediaquery.width * 0.8,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(
                              image: list[index].image!,
                              location: list[index].location!,
                              price: list[index].price!,
                              title: list[index].title!,
                            ))),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          list[index].image!,
                          height: 130,
                          width: mediaquery.width,
                          fit: BoxFit.fill,
                        ),
                        Row(
                          children: [
                            Text(
                              list[index].title!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              list[index].rating!.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.black45,
                            ),
                            Text(
                              list[index].location!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Text(
                            '\$${list[index].price!.toString()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
