import 'package:dotcoder1/Screens/onboarding/RegisterAccount.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';
import '../../widgets/textfields/butons/Myfilledbutton.dart';

class MyPageView extends StatefulWidget {
  static const String routename = '/Smoothpageindicaation';

  const MyPageView({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();
  final int pageCount = 3; // Number of pages

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: mediaquery.height * 0.02),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegistrationScreen.routename);
                },
                child: Text(
                  'Skip',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  _buildmypage("images/handsomafarican.png",
                      "Get your Groceries\n     easily with us", 15.0),
                  _buildmypage("images/image 3.png",
                      "Place your order\nget fast delivery", 15.0),
                  _buildmypage("images/image 6.png",
                      "Buy Fresh Fruit\nand Vegetables", 0.0),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: pageCount,
              effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GradientElevatedButton(
                text: 'Next',
                onPressed: () {
                  (_pageController.page! < pageCount - 1)
                      ? {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease,
                          )
                        }
                      : Navigator.pushReplacementNamed(
                          context, RegistrationScreen.routename);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildmypage(String image, String boldtext, double leftpadding) {
    final mediaquery = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: mediaquery.height * 0.03),
        Padding(
            padding: EdgeInsets.only(left: leftpadding),
            child: Image(
              image: AssetImage(image),
              height: mediaquery.height * 0.4,
            )),
        BoldText(text: boldtext),
        SizedBox(height: mediaquery.height * 0.03),
        const Thintext(
            text:
                "You can access all verity of groceries\n  here and fast delivery service system"),
        // SizedBox(height: mediaquery.height * 0.03),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
