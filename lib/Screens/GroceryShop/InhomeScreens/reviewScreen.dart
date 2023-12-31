import 'package:flutter/material.dart';

import '../../../models/productmodel.dart';
import '../../../widgets/customappbar.dart';
import '../../../widgets/text/constants.dart';

class ReviewsBuilderScreen extends StatefulWidget {
  const ReviewsBuilderScreen({super.key});

  @override
  State<ReviewsBuilderScreen> createState() => _ReviewsBuilderScreenState();
}

class _ReviewsBuilderScreenState extends State<ReviewsBuilderScreen> {
  List<ProductModel> list = [
    ProductModel(
      title: 'Blazzing Store',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Blazzing Store',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Blazzing Store',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Blazzing Store',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Blazzing Store',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Blazzing Store',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    ),
    ProductModel(
      title: 'Authentic Pantry',
      image:
          'https://th.bing.com/th/id/OIP.HVoahcVZ6UJSTse0w1fItAHaLH?pid=ImgDet&rs=1',
      rating: 3,
      location: '91 park st,12',
      isfav: false,
    )
  ];
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
        appBar: MYDetailsappbar(
          text: "All Reviews",
          onpressed: () => Navigator.pop(context),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 118,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the container background color
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      width: 0.5,
                      color: Colors.black
                          .withOpacity(0.05)), // Optional: Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // Shadow color
                      spreadRadius: 0, // Spread radius (controls the blur)
                      blurRadius: 2.84415602684021, // Blur radius
                      offset: const Offset(0, 2), // Offset in the x and y axes
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(8),
                child: SizedBox(
                  width: mediaquery.width *
                      0.7, // Replace with your desired fixed width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                list[index].image!,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only( left: 10),
                                child: Text(
                                  list[index].title!,
                                  style: k12_8B500style,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0,left:8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xff737373),
                                      size: 15,
                                    ),
                                    Text(
                                      list[index].location!,
                                      style: k10grey300style,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [
                                Image.asset('images/star1.png',width: 14.25,height:  14.25,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    list[index].rating!.toStringAsFixed(1),
                                    style: k12B600style,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet, Lorem \nipsum dolor sit amet, consectetur ',
                          style: k12Grey400style,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
