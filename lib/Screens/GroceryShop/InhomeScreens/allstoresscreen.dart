import 'package:flutter/material.dart';

import '../../../models/productmodel.dart';
import '../../../widgets/customappbar.dart';

class AllStoresscreen extends StatefulWidget {
  static const String routename = '/AllStoresscreen';
  const AllStoresscreen({super.key});

  @override
  State<AllStoresscreen> createState() => _AllStoresscreenState();
}

class _AllStoresscreenState extends State<AllStoresscreen> {
  List<ProductModel> list = [
    ProductModel(
      title: 'Blazzing Store',
      image: 'images/Group 7066.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Blazzing Store',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MYDetailsappbar(
        text: 'All Stores',
        onpressed: () => Navigator.pop(context),
      ),
      body: SizedBox(
        height: mediaquery.height,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              surfaceTintColor: Colors.white,
              elevation: 2,
              margin: const EdgeInsets.all(8),
              child: SizedBox(
                width:
                    mediaquery.width, // Replace with your desired fixed width
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            list[index].image!,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 18.0, left: 10),
                              child: Text(
                                list[index].title!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                      color: Colors.black45, fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    list[index].rating!.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              list[index].isfav = !list[index].isfav;
                              // print("object"); // Toggle favorite state
                            });
                          },
                          child: Icon(
                            list[index].isfav
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                        'Lorem ipsum dolor sit amet, Lorem \nipsum dolor sit amet, consectetur ')
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
