import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import 'package:flutter/material.dart';

import '../../../models/productmodel.dart';
import '../../../widgets/customappbar.dart';

// ignore: must_be_immutable
class TopsellingListScreen extends StatelessWidget {
  static const String routename = '/TopsellingListScreen';
  List<ProductModel> list = [
    ProductModel(
      title: "Orgnaic",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 23,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "Orange",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 64,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "Gun",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "shorma",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "alo",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "pizza",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "burger",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "boring",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "nightmare",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "chines bili",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
    ProductModel(
      title: "bullet",
      image:
          "https://th.bing.com/th/id/OIP.XPgwtCeQVtwrI4cEcCnrjQHaGS?w=210&h=180&c=7&r=0&o=5&dpr=1.1&pid=1.7",
      price: 45,
      location: '91 park st,12',
    ),
  ];
  // final List<String> imagepath = [
  //   'images/Group 7066.png',
  //   'images/Group 1171276027.png',
  //   'images/Group 1171276027.png',
  // ];
  // final List<String> title = ['Orgnaic Mango', 'Fresh Orange'];
  // final List<String> subTitle = [
  //   'Dollar pantry',
  //   'Dollar pantry',
  // ];
  // final List<String> price = [
  //   '\$40',
  //   '\$13.5',
  // ];

  TopsellingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments;
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: MYDetailsappbar(
          text: 'Top Selling',
          onpressed: () => Navigator.pop(context),
        ),
        body: Center(
          child: SizedBox(
            height: mediaquery.height,
            width: mediaquery.width * 0.8,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
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
                      width: 225,

                      // Replace with your desired fixed width
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  list[index].title!,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                              Image.network(
                                list[index].image!,
                                height: 83,
                                width: 120,
                                fit: BoxFit.fill,
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
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              '\$${list[index].price!.toStringAsFixed(1)}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
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
      ),
    );
  }
}
