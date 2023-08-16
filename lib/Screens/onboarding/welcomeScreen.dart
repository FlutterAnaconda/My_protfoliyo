import 'package:dotcoder1/Screens/onboarding/beautifulneigerian.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Providers/usertype.dart';
import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';
import '../../widgets/textfields/butons/Myfilledbutton.dart';

import '../../widgets/textfields/butons/outlinebutton.dart';
import 'Smoothpageindiactor.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final whichuser = Provider.of<Usertype>(context);
    bool isbuyer = false;

    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
          backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
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
                  Text(
                    'You can access all verity of groceries\nhere and fast delivery service system',
                    style: k14Grey500style,
                  ),
                  SizedBox(height: mediaquery.height * 0.04),
                  SizedBox(
                    width: 275,
                    child: GradientElevatedButton(
                      text: 'Login as a user',
                      onPressed: () {
                        // Add your button's onPressed logic here
                        setState(() {
                          isbuyer = true;
                          whichuser.isUser(isbuyer);
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Beautifulneigerion())
                            // MyPageView.routename
                            );
                      },
                    ),
                  ),
                  SizedBox(height: mediaquery.height * 0.02),
                  SizedBox(
                    width: 275,
                    child: Myoutlinebutton(
                        onTap: () {
                          setState(() {
                            isbuyer = false;
                            whichuser.isUser(isbuyer);
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Beautifulneigerion(),
                              ));
                        },
                        text: 'Login as a vendor'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
