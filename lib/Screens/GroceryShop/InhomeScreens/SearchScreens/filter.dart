import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/SearchScreens/rangeslider.dart';
import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/SearchScreens/selectloaction.dart';
import 'package:dotcoder1/Screens/GroceryShop/InhomeScreens/SearchScreens/selectrating.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';

import 'mycheckboxlist.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: MYDetailsappbar(
          text: 'Filter', onpressed: () => Navigator.pop(context)),

      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              'All Catergories',
              style: k16B600style,
            ),
          ),
          const MyCheckboxList(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Price Range',
              style: k16B600style,
            ),
          ),
          const SizedBox(height: 60, child: PriceRangeSlider()),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Rating',
              style: k16B600style,
            ),
          ),
          const SelectRating(),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,top: 10),
            child: Text(
              'Location',
              style: k16B600style,
            ),
          ),
            LocationSlider(),
          // SizedBox(height: 140, child: MySliderWithTooltip),
        ]),
      ),
    ));
  }
}
