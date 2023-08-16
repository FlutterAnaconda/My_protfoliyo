import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';
import '../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../widgets/textfields/textfield.dart';
import 'SigninScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routename = '/RegistrationScreen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool showpass = true;
  bool showpass1 = true;
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
          body: SizedBox(
            height: mediaquery.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: mediaquery.height * 0.07,
                  ),
                  Image(
                    image: const AssetImage('images/registerimage.png'),
                    height: mediaquery.height * 0.2,
                  ),
                  SizedBox(
                    height: mediaquery.height * 0.02,
                  ),
                  const BoldText(text: "Register Account"),
                  SizedBox(
                    height: mediaquery.height * 0.02,
                  ),
                  const Thintext(
                      text:
                          "Welcome here, Enter your information\n           for creating your account"),
                  const SizedBox(
                    height: 30,
                  ),
                  MyTextFormField(
                    name: 'name', // Assign a name to the form field
                    labelText: 'Name',
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    name: 'email', // Assign a name to the form field
                    labelText: 'Email',
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 20,
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
                            ? Container(
                                height: 20,
                                width: 20,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  width:
                                      20, // Adjust the image width within the container
                                  height: 20,
                                  'images/eye.png',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.blue,
                                size: 20,
                              )),
                  ),
                  const SizedBox(
                    height: 20,
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
                            ? Container(
                                height: 20,
                                width: 20,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  width:
                                      20, // Adjust the image width within the container
                                  height: 20,
                                  'images/eye.png',
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.blue,
                                size: 20,
                              )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GradientElevatedButton(
                    text: 'Next',
                    onPressed: () {
                      // Perform form submission
                    },
                  ),
                  // SizedBox(
                  //   height: mediaquery.height * 0.01,
                  // ),
                  SizedBox(
                    width: mediaquery.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignInScreen.routename);
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
