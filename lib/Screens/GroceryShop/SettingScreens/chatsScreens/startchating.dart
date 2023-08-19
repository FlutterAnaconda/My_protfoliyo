import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/customappbar.dart';
import '../../../../widgets/text/constants.dart';
import 'ChoosechatStoreScreen.dart';

class StartchatindScreen extends StatelessWidget {
  const StartchatindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MYDetailsappbar(
          text: 'Chat',
          onpressed: () {
            Navigator.pop(context);
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset('images/chatstrat.png'),
            Text(
              'No Conversation yet?',
              style: k20darkgrey400,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
        child: GradientElevatedButton(
            text: 'Start Chat',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => const ChoosechatStoreScreen()),
                ),
              );
            }),
      ),
    );
  }
}
