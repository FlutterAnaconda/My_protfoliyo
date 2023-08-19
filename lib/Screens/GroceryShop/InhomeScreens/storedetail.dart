import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/productdetailsscreen.dart';
import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/productmodel.dart';
import '../../../widgets/customappbar.dart';

class Storesdetailscreen extends StatefulWidget {
  static const String routename = '/AllStoresscreen';
  final String imagepath;
  final String title;
  final String location;
  final int rating;
  final bool isfav;

  const Storesdetailscreen(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.location,
      required this.rating,
      required this.isfav});

  @override
  State<Storesdetailscreen> createState() => _StoresdetailscreenState();
}

class _StoresdetailscreenState extends State<Storesdetailscreen> {
  final List<Widget> tabs = [
    const Tab(text: 'All'),
    const Tab(text: 'Meat'),
    const Tab(text: 'Cooking'),
    const Tab(text: 'Fruits'),
    const Tab(text: 'Vegetables'),
    const Tab(text: 'Dairy'),
  ];

  // List<ProductModel> list = [
  //   ProductModel(
  //     title: 'Blazzing Store',
  //     image: 'images/Group 7066.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Blazzing Store',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Authentic Pantry',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Authentic Pantry',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Authentic Pantry',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Authentic Pantry',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Authentic Pantry',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Authentic Pantry',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  //   ProductModel(
  //     title: 'Authentic Pantry',
  //     image: 'images/Group 1171276027.png',
  //     rating: 3,
  //     location: '91 park st,12',
  //     isfav: false,
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MYDetailsappbar(
          text: 'Store Details',
          onpressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const HomeScreen())))),
      body: DefaultTabController(
        length: tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 433.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Image.asset('images/store.png', fit: BoxFit.cover),
                      buildsinglestore(
                        widget.imagepath,
                        widget.title,
                        widget.location,
                        widget.rating,
                        widget.isfav,
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              TabBar(
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                labelColor: Theme.of(context).primaryColor,
                labelPadding: const EdgeInsets.symmetric(horizontal: 11),
                unselectedLabelColor: const Color(0xff868889),
                labelStyle: k12Grey400style,
                tabs: tabs,
                dividerColor: Colors.white,
              ),
              Expanded(
                child: TabBarView(
                  children: tabs.map((tab) {
                    // You can return different content for each tab
                    return buildContentForTab(); // Implement your content widgets
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ProductModel> list = [
    ProductModel(
        title: 'zulam',
        image: 'images/Group 7066.png',
        rating: 3,
        location: '91 park st,12',
        price: 25,
        discount: true,),
    ProductModel(
        title: 'italia',
        image: 'images/Group 1171276027.png',
        rating: 3,
        location: '91 park st,12',
        price: 20,
        discount: true,),
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
    ),
    ProductModel(
      title: 'glue',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      discount: true,
    ),
    ProductModel(
      title: 'master',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'shifoo',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
      discount: true,
    ),
    ProductModel(
      title: 'doremon',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'pizzahot',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'speicy pizza',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
    ProductModel(
      title: 'cucumber juice',
      image: 'images/Group 1171276027.png',
      rating: 3,
      location: '91 park st,12',
      price: 25,
    ),
  ];

  Widget buildContentForTab() {
    // Implement the content for each tab here
    return ListView.builder(
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the container background color
              borderRadius:
                  BorderRadius.circular(9), // Optional: Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  spreadRadius: 0, // Spread radius (controls the blur)
                  blurRadius: 3.5630252361297607, // Blur radius
                  offset: const Offset(
                      0, 1.7815126180648804), // Offset in the x and y axes
                ),
              ],
            ),
            margin: const EdgeInsets.all(8),
            child: Stack(
              children: [
               list[index].discount!? Positioned(
                  right: 20,
                  child:Container(
                    width: 30,
                    height: 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(list[index].price! ==25?'images/yellow.png':'images/green.png',),
                          fit: BoxFit.cover, // Adjust the fit to your needs
                        ),),

                  )
                ):Container(),
                SizedBox(
                  height: 100, // Replace with your desired fixed width
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9)),
                        child: Image.asset(
                          list[index].image!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].title!,
                            style: GoogleFonts.poppins(
                              fontSize: 16.03,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff34A853),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/star1.png',
                                width: 14.25,
                                height: 14.25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 2.0, left: 6),
                                child: Text(
                                  list[index].rating!.toStringAsFixed(1),
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, fontWeight: FontWeight.w400
                                      // fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Text(
                                '(24)',
                                style: k12lightgrey400,
                              )
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 18.0, top: 15),
                            child: Text(
                              '\$${list[index].price!.toStringAsFixed(1)}',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildsinglestore(
      String imagepath, String title, String location, int rating, bool isfav) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set the container background color
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            width: 0.5,
            color: Colors.black.withOpacity(0.05)), // Optional: Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 0, // Spread radius (controls the blur)
            blurRadius: 2.84415602684021, // Blur radius
            offset: const Offset(0, 2), // Offset in the x and y axes
          ),
        ],
      ),
      // margin: const EdgeInsets.all(8),
      child: SizedBox(
        width: double.infinity,
        height: 191, // Replace with your desired fixed width
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      imagepath,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, left: 10),
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 12.8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xff737373),
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            location,
                            style: GoogleFonts.poppins(
                                color: Colors.black45, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 130,
                          height: 18,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Image.asset(
                                  'images/star1.png',
                                  height: 16,
                                  width: 16,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Image.asset(
                    isfav ? 'images/fillheart.png' : 'images/heart.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 8),
              child: Text(
                'Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.consectetur adipiscing. ',
                style: k12Grey400style,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/delivery.png',
                    scale: 3,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Delivery time',
                    style: k12B600style,
                  ),
                  Text(
                    ': 2-3 hours.',
                    style: k12Grey400style,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}










