import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/subscriptionpackages.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/subcriptionmodel.dart';
// import '../../../widgets/textfields/butons/Myfilledbutton.dart';

class SubscribtionScreen extends StatefulWidget {


  const SubscribtionScreen({super.key,});

  @override
  State<SubscribtionScreen> createState() => _SubscribtionScreenState();
}

class _SubscribtionScreenState extends State<SubscribtionScreen> {
  final List<SubscribeModel> list = [
    SubscribeModel('images/basic.png', 'Basic', '390', '120', '400', '30',0xff613EEA),
    SubscribeModel(
        'images/inter.png', 'Intermadiate', '490', '200', '618', '55',0xffFB923C),
    SubscribeModel('images/advance.png', 'Advance', '690', '360', '1000', '75',0xff259EB9),
  ];
  PageController pageController = PageController();
  int pageCount = 3;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
       SizedBox(
        width: 900,
         child: SingleChildScrollView(
           child: Column(
            children: [
              SizedBox(
                height: 770,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: pageCount,
                  itemBuilder: (context, index) {
                    return SubcribepackageScreen(
                      imagepath: list[index].imagepath,
                      packagename: list[index].packagename,
                      packageprice: list[index].packageprice,
                      validdays: list[index].validdays,
                      maxorder: list[index].maxorder,
                      maxproduct: list[index].maxproduct, color: list[index].color,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: pageCount,
                effect: const CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                      height: 10,
                      color: Color(0xff34A853),
                      width: 40,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  dotDecoration: DotDecoration(
                    height: 10,
                    width: 10,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    dotBorder: DotBorder(
                      color: Color(0xff34A853),
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: GradientElevatedButton(
              //     text: 'Next',
              //     onPressed: () {
              //       (pageController.page! < pageCount - 1)
              //           ? {
              //               pageController.nextPage(
              //                 duration: const Duration(milliseconds: 500),
              //                 curve: Curves.ease,
              //               )
              //             }
              //           : null;
              //     },
              //   ),
              // ),
            ],
      ),
         ),
       );

  }
}
