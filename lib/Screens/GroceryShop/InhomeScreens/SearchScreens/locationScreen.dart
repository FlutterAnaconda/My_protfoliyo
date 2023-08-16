import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/textfields/butons/outlinebutton.dart';
import 'mapScreen.dart';

class PickLocationScreen extends StatelessWidget {
  const PickLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: MYDetailsappbar(
          text: 'Set Location',
          onpressed: () {
            Navigator.pop(context);
          }),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'images/loclogo.png',
              height: 229,
              width: 256,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                'Find Stores & items\n         Near You!!',
                style: k22B600style,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'By allowing location access, you can\nsearch for stores & items near you.',
              style: k14Grey300style,
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                GradientElevatedButton(
                    text: 'Use Current Location', onPressed: () {}),
                Positioned(
                    top: 14,
                    left: 45,
                    child: Image.asset(
                      'images/Currentloc.png',
                      height: 21.9,
                      width: 21.9,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Myoutlinebutton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapScreen(),
                          ));
                    },
                    text: 'Set From Map'),
                Positioned(
                    top: 12,
                    left: 70,
                    child: Image.asset(
                      'images/onmap.png',
                      height: 24,
                      width: 24,
                    ))
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
