import 'package:dotcoder1/Screens/GroceryShop/SettingScreens/profilediting.dart';
import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../models/paymentmethod.dart';
import '../../../models/switchinprofilemodel.dart';
import '../../../widgets/text/constants.dart';

// ignore: must_be_immutable
class UserInfo extends StatefulWidget {
  const UserInfo({super.key});
  static const List<PaymentMethodModel> list = [
    PaymentMethodModel('joining', '03 Days'),
    PaymentMethodModel('Loylaty Points ', '45'),
    PaymentMethodModel('Total Orders', '4'),
    PaymentMethodModel('Total Amount', '\$44'),
  ];

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  List<SwitchInprofileModel> switchlist = [
    SwitchInprofileModel('Notification', false),
    SwitchInprofileModel('Dark Mode ', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileUpdateScreen(),
                          ));
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.amber,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        'images/editable.png',
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
              'Syed Fawad Hussain',
              style: k18B700style,
            ),
            Text(
              'fawadh747@gmail.com',
              style: k12B500style,
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                  height: 200,
                  width: 342,
                  decoration: cardcontainerdecoration,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: UserInfo.list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    UserInfo.list[index].imageurl,
                                    style: k12Grey400style,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    UserInfo.list[index].text,
                                    style: k12_94G400style,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                height: 1,
                                width: 280,
                                color: const Color(0xffEBEBF0),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
            ),
            SizedBox(
              height: 170,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: switchlist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Container(
                      height: 60,
                      width: 342,
                      decoration: cardcontainerdecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Text(
                              switchlist[index].text,
                              style: k16Grey400style,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.5,
                            child: Switch(
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: const Color(0xffD6D8DA),
                                activeTrackColor: const Color(0xff07CD6E),
                                thumbColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.white.withOpacity(.48);
                                  }
                                  return Colors.white;
                                }),
                                trackOutlineColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return const Color(0xffD6D8DA)
                                        .withOpacity(.48);
                                  }
                                  return const Color(0xff07CD6E).withOpacity(0);
                                }),
                                activeColor: Theme.of(context).primaryColor,
                                value: switchlist[index].ischeck,
                                onChanged: (_) {
                                  setState(() {
                                    switchlist[index].ischeck =
                                        !switchlist[index].ischeck;
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
        child: GradientElevatedButton(
            text: 'Delete Account?',
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ));
            }),
      ),
    );
  }
}
