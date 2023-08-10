import 'package:flutter/material.dart';

import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';
import '../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../widgets/textfields/textfield.dart';

class Newpassword extends StatefulWidget {
  static const String routename = '/Newpassword';

  const Newpassword({Key? key}) : super(key: key);

  @override
  State<Newpassword> createState() => _NewpasswordState();
}

class _NewpasswordState extends State<Newpassword> {
  final TextEditingController _passwordController = TextEditingController();
  bool showpass = true;
  bool showpass1 = true;
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: mediaquery.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaquery.height * 0.02,
                ),
                Image(
                  image: const AssetImage('images/registerimage.png'),
                  height: mediaquery.height * 0.2,
                ),
                SizedBox(
                  height: mediaquery.height * 0.02,
                ),
                const BoldText(text: " Account Recovery"),
                SizedBox(
                  height: mediaquery.height * 0.02,
                ),
                const Thintext(
                    text:
                        "   Enter your new password\n for accessing your account"),
                SizedBox(
                  height: mediaquery.height * 0.05,
                ),
                MyTextFormField(
                  obscure: showpass,
                  name: 'Password', // Assign a name to the form field
                  labelText: 'Password',
                  controller: _passwordController,
                  suffixicon: InkWell(
                      onTap: () {
                        showpass = !showpass;
                        setState(() {});
                      },
                      child: showpass
                          ? const Icon(Icons.visibility_off)
                          : const Icon(
                              Icons.visibility,
                              color: Colors.blue,
                            )),
                ),
                SizedBox(
                  height: mediaquery.height * 0.01,
                ),
                MyTextFormField(
                  obscure: showpass1,
                  name: 'ConfirmPassword', // Assign a name to the form field
                  labelText: 'ConfirmPassword',
                  controller: _confirmPasswordController,
                  suffixicon: InkWell(
                      onTap: () {
                        showpass1 = !showpass1;
                        setState(() {});
                      },
                      child: showpass1
                          ? const Icon(Icons.visibility_off)
                          : const Icon(
                              Icons.visibility,
                              color: Colors.blue,
                            )),
                ),
                SizedBox(
                  height: mediaquery.height * 0.07,
                ),
                GradientElevatedButton(
                  text: 'Forgot',
                  onPressed: () {
                    // Perform form submission
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
