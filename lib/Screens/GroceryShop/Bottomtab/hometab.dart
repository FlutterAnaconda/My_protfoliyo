import 'package:dotcoder1/Screens/GroceryShop/Bottomtab/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Providers/usertype.dart';
import '../../../widgets/listveiwbuilders/Allstores.dart';
import '../../../widgets/listveiwbuilders/TopSelling.dart';

import '../../../widgets/listveiwbuilders/catergorybuilder.dart';
import '../../../widgets/listveiwbuilders/hometopimagebuilder.dart';
import '../../../widgets/listveiwbuilders/newArrivalbulder.dart';
import '../../../widgets/listveiwbuilders/offerforyou.dart';

import '../../../widgets/text/homerowtext.dart';
import '../../../widgets/textfields/searchtextfeild.dart';
import '../InhomeScreens/NewArrivalScreen.dart';
import '../InhomeScreens/SearchScreens/filter.dart';
import '../InhomeScreens/SearchScreens/locationScreen.dart';
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
    final islocationicon = Provider
        .of<Usertype>(context)
        .islocationicon;

    return Scaffold(
      // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap: () {
                      // Add your logic here for the first icon onTap event.
                    },
                    child: const Image(
                      image: AssetImage('images/menu-bar 1.png',),
                      width: 25,
                      height: 24,
                    ),
                  ),
                ),

                Text(
                  'Grocery Shop',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:4.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const CartScreen(cartItems: [],),));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Image(
                        image: AssetImage('images/cart.png'),
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              // mainAxisAlignment: M,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  // height: 100, // Set a fixed height for the row
                  child: SearchTextField(
                    controller: searchcontroller,
                    suggestions: searchSuggestions,
                    isexpanded: false,
                    hinttext: 'Search Categories', iscolorchanged: false,
                  ),
                ),
                const SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            islocationicon
                                ? const PickLocationScreen()
                                : const FilterScreen(),
                          ));
                    },
                    child: Container(
                        height: 49.41,
                        width: 44,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(250, 240, 249, 250),
                          // border: OutlinedBorder(
                          //   borderRadius: BorderRadius.circular(8.0),
                          //   borderSide: BorderSide.none,
                        ),
                        child: islocationicon
                            ? Icon(
                          Icons.location_on,
                          color: Theme
                              .of(context)
                              .primaryColor,
                          size: 23,
                        )
                            : Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          child: Image.asset(
                            width:
                            20, // Adjust the image width within the container
                            height: 20,
                            'images/filtericon.png',
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllStoresscreen())),
            ),
            const AllStores(),
          ],
        ),
      ),
    );
  }
}
