import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/listveiwbuilders/Allstores.dart';
import '../../../widgets/listveiwbuilders/TopSelling.dart';

import '../../../widgets/listveiwbuilders/catergorybuilder.dart';
import '../../../widgets/listveiwbuilders/hometopimagebuilder.dart';
import '../../../widgets/listveiwbuilders/newArrivalbulder.dart';
import '../../../widgets/listveiwbuilders/offerforyou.dart';

import '../../../widgets/text/homerowtext.dart';
import '../../../widgets/textfields/searchtextfeild.dart';
import '../InhomeScreens/NewArrivalScreen.dart';
import '../InhomeScreens/allstoresscreen.dart';
import '../InhomeScreens/categoreyscreen.dart';
import '../InhomeScreens/offerforyou.dart';
import '../InhomeScreens/topsellings.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController searchcontroller = TextEditingController();
  List<String> searchSuggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Mango',
    'Orange',
    'Pineapple',
    'Strawberry',
    'Watermelon',
  ];
  @override
  Widget build(BuildContext context) {
    // final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              // Add your logic here for the first icon onTap event.
            },
            child: const Padding(
              padding: EdgeInsets.all(13.0),
              child: Image(
                image: AssetImage('images/menu-bar 1.png'),
              ),
            ),
          ),
          title: Text(
            'Grocery Shop',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                // Add your logic here for the second icon onTap event.
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Image(
                  image: AssetImage('images/cart.png'),
                  height: 25,
                ),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                // mainAxisAlignment: M,

                children: [
                  Expanded(
                    child: SizedBox(
                      // height: 100, // Set a fixed height for the row
                      child: SearchTextField(
                        controller: searchcontroller,
                        suggestions: searchSuggestions,
                      ),
                    ),
                  ),
                  Container(
                      height: 65,
                      width: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffF8F9FB),
                        // border: OutlinedBorder(
                        //   borderRadius: BorderRadius.circular(8.0),
                        //   borderSide: BorderSide.none,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ))
                ],
              ),
            ),
            ImageSlider(),
            Myhomerowtext(
              text: 'Categories',
              ontap: () => Navigator.pushNamed(context, AllCategory.routename),
            ),
            CatergoryBuilder(),
            Myhomerowtext(
              text: 'Top Selling',
              ontap: () =>
                  Navigator.pushNamed(context, TopsellingListScreen.routename),
            ),
            const TopsellingListview(),
            Myhomerowtext(
              text: 'New Arrival',
              ontap: () =>
                  Navigator.pushNamed(context, NewarrivalListScreen.routename),
            ),
            NewarrivalListview(),
            Myhomerowtext(
              text: 'Offers For You',
              ontap: () =>
                  Navigator.pushNamed(context, OfferListScreen.routename),
            ),
            OfferListveiw(),
            Myhomerowtext(
              text: 'All Stores',
              ontap: () =>
                  Navigator.pushNamed(context, AllStoresscreen.routename),
            ),
            const AllStores(),
          ],
        ),
      ),
    );
  }
}
