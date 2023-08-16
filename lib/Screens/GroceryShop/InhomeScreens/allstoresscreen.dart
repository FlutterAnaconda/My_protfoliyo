import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Providers/storeprovider.dart';
import '../../../models/productmodel.dart';

import '../Bottomtab/Storetab.dart';

class AllStoresscreen extends StatefulWidget {
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
    )
  ];
  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: MYDetailsappbar(
          text: 'All Stores',
          onpressed: () {
            Navigator.pop(context);
          },
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => {
                Provider.of<StoreProvider>(context, listen: false)
                    .selectStore(list[index]),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StoreTab(),
                  ),
                ),
              },
              child: Container(
                height: 130,
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
                  width: 252, // Replace with your desired fixed width
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                list[index].image!,
                              ),
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
                                  ),
                                  Text(
                                    list[index].location!,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black45, fontSize: 12),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('images/star1.png',width: 14.25,height:  14.25,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      list[index].rating!.toStringAsFixed(1),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
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
                                // Toggle favorite state
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child:  Image.asset(
                                list[index].isfav
                                    ? 'images/fillheart.png'
                                    : 'images/heart.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, Lorem \nipsum dolor sit amet, consectetur ',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff9C9898)),
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
