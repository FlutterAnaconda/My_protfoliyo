import 'package:dotcoder1/Screens/GroceryShop/SettingScreens/help.dart';
import 'package:dotcoder1/Screens/GroceryShop/SettingScreens/policies.dart';
import 'package:dotcoder1/Screens/GroceryShop/SettingScreens/userinfo.dart';
import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../../../models/setting_tab_model.dart';
import '../../../widgets/listveiwbuilders/settinglistview.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';

import '../SettingScreens/Term&conditions.dart';
import '../SettingScreens/aboutus.dart';

import '../SettingScreens/chatsScreens/startchating.dart';
import '../SettingScreens/language.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  int? index;
  final List<SettingtabModel> items = [
    SettingtabModel(
        iconspath: 'images/settingicons/s1.png',
        onpressed: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const UserInfo()),
              ));
        },
        title: 'User Information'),
    SettingtabModel(
        iconspath: 'images/settingicons/s2.png',
        onpressed: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => LangScreen()),
            ),
          );
        },
        title: 'Languages'),

    SettingtabModel(
        iconspath: 'images/settingicons/s3.png',
        onpressed: (context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const PolicesScreen(
                    answer: [
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec frngilla accumsan, risus sem sollicitudin lacus, ut interdum tellus. '
                    ],
                    appbartitle: 'Privacy Policy',
                    height: 500,
                    numberofQAs: 1,
                    question: ['You need to fulfil these requirements'],
                  )),
            ),
          );
        },
        title: 'Privacy Policy'),

    SettingtabModel(
      iconspath: 'images/settingicons/s11.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const AboutusScreen()),
          ),
        );
      },
      title: 'About Us',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s4.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const TermconScreen()),
          ),
        );
      },
      title: 'Terms & Conditions',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s5.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const StartchatindScreen()),
          ),
        );
      },
      title: 'Chat',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s6.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const PolicesScreen(
                  answer: [
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec frngilla accumsan, risus sem sollicitudin lacus, ut interdum tellus. '
                  ],
                  appbartitle: 'Refund Policy',
                  height: 500,
                  numberofQAs: 1,
                  question: ['You need to fulfil these requirements'],
                )),
          ),
        );
      },
      title: 'Refund Policy',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s7.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const PolicesScreen(
                  answer: [
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec frngilla accumsan, risus sem sollicitudin lacus, ut interdum tellus. '
                  ],
                  appbartitle: 'Cancelation Policy',
                  height: 500,
                  numberofQAs: 1,
                  question: ['You need to fulfil these requirements'],
                )),
          ),
        );
      },
      title: 'Cancelation Policy',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s8.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const PolicesScreen(
                  answer: [
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus.',
                    ' Class aptent taciti sociosqu ad litora torquent per conubia nostra, per Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec frngilla accumsan, risus sem sollicitudin lacus, ut interdum tellus. '
                  ],
                  appbartitle: 'Shipping Policy',
                  height: 500,
                  numberofQAs: 2,
                  question: [
                    'You need to fulfil these requirements',
                    'You need to access these requirements'
                  ],
                )),
          ),
        );
      },
      title: 'Shipping Policy',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s9.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => LangScreen()),
          ),
        );
      },
      title: 'Coupon',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s10.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const HelpScreen()),
          ),
        );
      },
      title: 'help',
    ),

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: 'Settings',
        onpressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ContainerListItem(
            onpressed: () => items[index].onpressed(context),
            title: items[index].title,
            iconspath: items[index].iconspath,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 5),
        child: GradientElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: ((context) => const SignInScreen()),
              ),
            );
          },
          text: 'Logout',
        ),
      ),
    );
  }
}
