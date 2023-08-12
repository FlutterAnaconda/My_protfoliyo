import 'package:dotcoder1/Screens/GroceryShop/SettingScreens/help.dart';
import 'package:dotcoder1/Screens/GroceryShop/SettingScreens/userinfo.dart';
import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:dotcoder1/Screens/onboarding/SigninScreen.dart';
import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../../../models/setting_tab_model.dart';
import '../../../widgets/listveiwbuilders/settinglistview.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import '../SettingScreens/Setting.dart';
import '../SettingScreens/aboutus.dart';
import '../SettingScreens/chatsScreens/chat.dart';
import '../SettingScreens/chatsScreens/startchating.dart';
import '../SettingScreens/language.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
              builder: ((context) => LangScreen()),
            ),
          );
        },
        title: 'Privacy Policy'),
    SettingtabModel(
      iconspath: 'images/settingicons/s4.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const SettingScreen()),
          ),
        );
      },
      title: 'Settings',
    ),
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
      iconspath: 'images/settingicons/s5.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => LangScreen()),
          ),
        );
      },
      title: 'Terms & Conditions',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s6.png',
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
      iconspath: 'images/settingicons/s7.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => LangScreen()),
          ),
        );
      },
      title: 'Refund Poliocy',
    ),
    SettingtabModel(
      iconspath: 'images/settingicons/s8.png',
      onpressed: (context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => LangScreen()),
          ),
        );
      },
      title: 'Cancelation policy',
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
      title: 'Shipping Policy',
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
      title: 'Help',
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
