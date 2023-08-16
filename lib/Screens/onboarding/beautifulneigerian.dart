import 'package:dotcoder1/Screens/onboarding/Smoothpageindiactor.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';

class Beautifulneigerion extends StatelessWidget {
  const Beautifulneigerion({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
            backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Image(
                    image: AssetImage('images/handsomafarican.png'),
                    height: 350,
                  )),
              const SizedBox(height: 15),
              const BoldText(text: 'Get your Groceries\n     easily with us'),
              const SizedBox(height: 15),
              const Thintext(
                  text:
                      "You can access all verity of groceries\n  here and fast delivery service system"),
              const SizedBox(height: 50),
              GradientElevatedButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MyPageView.routename);
                  })
            ],
          ),
        )),
      ),
    );
  }
}
