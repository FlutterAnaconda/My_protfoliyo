import 'package:dotcoder1/Screens/onboarding/newpassword.dart';
import 'package:flutter/material.dart';

import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';
import '../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../widgets/textfields/textfield.dart';

class ForgotScreen extends StatefulWidget {
  static const String routename = '/ForgotScreen';
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: mediaquery.height * 0.02,
          ),
          Image(
            image: const AssetImage('images/registerimage.png'),
            height: mediaquery.height * 0.2,
          ),
          SizedBox(
            height: mediaquery.height * 0.01,
          ),
          const BoldText(text: "Forgot Password"),
          SizedBox(
            height: mediaquery.height * 0.005,
          ),
          const Thintext(
              text: "     Enter your email for\n changing your password"),
          SizedBox(
            height: mediaquery.height * 0.03,
          ),
          MyTextFormField(
            name: 'Email', // Assign a name to the form field
            labelText: 'Email',
            controller: _nameController,
          ),
          const SizedBox(
            height: 30,
          ),
          GradientElevatedButton(
            text: 'Next',
            onPressed: () {
              Navigator.pushNamed(context, Newpassword.routename);
            },
          ),
        ]),
      ),
    );
  }
}
