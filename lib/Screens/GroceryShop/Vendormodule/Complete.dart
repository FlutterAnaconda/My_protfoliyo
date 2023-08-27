import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/textfields/butons/outline_to_fill_button.dart';
class CompleteScreen extends StatefulWidget {
  final VoidCallback onslide;
  const CompleteScreen({super.key, required this.onslide});

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  bool isTapped=true;
  bool isTapped1=false;

  void _onButtonTap() {
    setState(() {
      isTapped = !isTapped;
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
  }
  void onButtonTap1() {
    setState(() {

      isTapped = !isTapped;
    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
  }

  @override
  Widget build(BuildContext context) {

    return Column(
mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Mytrialbutton(isTapped: isTapped,ontap: (){
          _onButtonTap();

        },text: 'Continue With 7 Days free trial',),
        const SizedBox(height: 20,),
        Mytrialbutton(isTapped: isTapped1,ontap: (){
          onButtonTap1();


        },text: 'Pay Manually',)
      ],
    );
  }
}
