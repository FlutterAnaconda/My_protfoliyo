import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/Screens/onboarding/RegisterAccount.dart';

import 'package:flutter/material.dart';

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
                SizedBox(
                  height: mediaquery.height * 0.02,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => Navigator.pushNamed(
                            context, ForgotScreen.routename),
                        child: Text(
                          'Forgot password',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        )),
                  ],
                ),
                SizedBox(
                  height: mediaquery.height * 0.03,
                ),
                GradientElevatedButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.routename);
                  },
                ),
                SizedBox(
                  height: mediaquery.height * 0.01,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Thintext(text: "--OR--")],
                ),
                MyLoginWithButton(
                    onTap: () => print("button pressed"),
                    text: 'Continue with google',
                    iconUrl:
                        'https://th.bing.com/th/id/R.fcba2d6c6d52823730773a50e2906eed?rik=sPByQ0%2bTf%2beU2Q&pid=ImgRaw&r=0'),
                SizedBox(
                  height: mediaquery.height * 0.01,
                ),
                MyLoginWithButton(
                    onTap: () => print("button pressed"),
                    text: 'Continue with Facebook',
                    iconUrl:
                        'https://th.bing.com/th/id/OIP.NM5qan4eTiNM6tXXvUkMsgHaH0?pid=ImgDet&rs=1'),
                SizedBox(
                  height: mediaquery.height * 0.01,
                ),
                SizedBox(
                  width: mediaquery.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'I don’t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
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
