import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/Screens/onboarding/RegisterAccount.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/text/BoldText.dart';
import '../../widgets/text/thintext.dart';
import '../../widgets/textfields/butons/Myfilledbutton.dart';
import '../../widgets/textfields/butons/loginwithbutton.dart';
import '../../widgets/textfields/textfield.dart';
import 'forgotpasswordScreen.dart';

class SignInScreen extends StatefulWidget {
  static const String routename = '/SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool showpass = true;
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
                    height: mediaquery.height * 0.02,
                  ),
                  Image(
                    image: const AssetImage('images/registerimage.png'),
                    height: mediaquery.height * 0.2,
                  ),
                  SizedBox(
                    height: mediaquery.height * 0.01,
                  ),
                  const BoldText(text: "Sign In"),
                  SizedBox(
                    height: mediaquery.height * 0.005,
                  ),
                  const Thintext(
                      text:
                          "Enter your information \n for accessing your sign in"),
                  SizedBox(
                    height: mediaquery.height * 0.03,
                  ),
                  MyTextFormField(
                    name: 'Email', // Assign a name to the form field
                    labelText: 'Email',
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 15,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, ForgotScreen.routename),
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).primaryColor),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: mediaquery.height * 0.03,
                  ),
                  GradientElevatedButton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen())
                          //  HomeScreen.routename
                          );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "--OR--",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyLoginWithButton(
                      onTap: () => print("button pressed"),
                      text: 'Continue with google',
                      iconUrl: 'images/google.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  MyLoginWithButton(
                      onTap: () => print("button pressed"),
                      text: 'Continue with Facebook',
                      iconUrl: 'images/fb.png'),
                  SizedBox(
                    height: mediaquery.height * 0.01,
                  ),
                  SizedBox(
                    width: mediaquery.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I don’t have an account?',
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RegistrationScreen.routename);
                          },
                          child: Text(
                            ' Sign up',
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
