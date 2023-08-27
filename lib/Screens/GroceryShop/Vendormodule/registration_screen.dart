import 'package:dotcoder1/Screens/GroceryShop/Vendormodule/plan.dart';
import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:dotcoder1/widgets/Stepper/Stepper.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import 'Complete.dart';
import 'Information.dart';
class VendorRegistration extends StatefulWidget {
  const VendorRegistration({super.key});

  @override
  State<VendorRegistration> createState() => _VendorRegistrationState();
}

class _VendorRegistrationState extends State<VendorRegistration> {
  final PageController _contentPageController = PageController(initialPage: 0);
  int? _currentPage;
  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _contentPageController.addListener(() {
      setState(() {
        _currentPage = _contentPageController.page!.toInt();
        // print("Currrnet page $_currentPage");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MYDetailsappbar(text: 'Registration',onpressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen(),));
      },),
      body:  Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Mystepper(currentindex: _currentPage,firsttext: 'Information', secondtext: 'Plans', thridtext: 'Complete', isdummyneeded: false,),
          ),
          Expanded(child: PageView(
            controller: _contentPageController,
            scrollDirection: Axis.horizontal,
            children:  [
              InformationScreen(
                      onslide: () {
                _contentPageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              }
              ),
              PlanScreen( onslide: () {
                _contentPageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              }),
              CompleteScreen( onslide: () {
                _contentPageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              }),

            ],
          ))
        ],
      ),
    );
  }
}
