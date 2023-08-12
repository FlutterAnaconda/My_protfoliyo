import 'package:flutter/material.dart';
import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';
import '../../widgets/textfields/butons/Myfilledbutton.dart';

import '../../widgets/textfields/butons/outlinebutton.dart';
import 'Smoothpageindiactor.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaquery.height,
          width: mediaquery.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: mediaquery.height * 0.03),
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image(
                      image: const AssetImage('images/Welcome Screen.png'),
                      height: mediaquery.height * 0.5,
                    )),
                const BoldText(
                    text: "Let’s sell & buy grocery\n        with easy way"),
                SizedBox(height: mediaquery.height * 0.03),
                const Thintext(
                    text:
                        'You can access all verity of groceries\nhere and fast delivery service system'),
                SizedBox(height: mediaquery.height * 0.04),
                GradientElevatedButton(
                  text: 'Login as a user',
                  onPressed: () {
                    // Add your button's onPressed logic here

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPageView())
                        // MyPageView.routename
                        );
                  },
                ),
                SizedBox(height: mediaquery.height * 0.02),
                Myoutlinebutton(
                    onTap: () => Navigator.pushReplacementNamed(
                        context, MyPageView.routename),
                    text: 'Login as a vendor'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
