import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../models/paymentmethod.dart';
import '../../../models/switchinprofilemodel.dart';
import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/textfield.dart';

// ignore: must_be_immutable
class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  TextEditingController namecontroller =
      TextEditingController(text: 'Syed Fawad Hussain');
  TextEditingController emailcontroller =
      TextEditingController(text: 'fawadh747@gmail.com');
  TextEditingController phonecontroller =
      TextEditingController(text: '03119478248');
  bool isnameempty = false;
  bool isemailempty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: "Profile",
        onpressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              clipBehavior: Clip.none,
              // alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1614595222974-8e6b3ad2a5ef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aGFuZHNvbWUlMjBtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                ),
                Positioned(
                  right: 10,
                  top: 82,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.amber,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        'images/procamera.png',
                        // height: 30,
                        // width: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              namecontroller.text,
              style: k18B700style,
            ),
            Text(
              emailcontroller.text,
              style: k12B500style,
            ),
            SizedBox(
                height: 500,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        MyTextFormField(
                          controller: namecontroller,
                          labelText: 'Name',
                          name: 'Name',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                          controller: emailcontroller,
                          labelText: 'Email',
                          name: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextFormField(
                          isreadonly: true,
                          controller: phonecontroller,
                          labelText: 'Phone Number(not changable)',
                          name: 'Phone Number',
                        ),
                      ],
                    )))
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
        child: GradientElevatedButton(
            text: 'Update',
            onPressed: () {
              setState(() {});
            }),
      ),
    );
  }
}
