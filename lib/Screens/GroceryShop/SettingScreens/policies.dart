import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/constants.dart';

class PolicesScreen extends StatelessWidget {
  final String appbartitle;
  final int numberofQAs;
  final List<String> question;
  final List<String> answer;
  final double height;
  const PolicesScreen(
      {super.key,
      required this.appbartitle,
      required this.numberofQAs,
      required this.question,
      required this.answer,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: appbartitle,
        onpressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'This is demo $appbartitle',
                    style: k16G600,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing\n elit. Etiam eu turpis molestie, dictum est a, mattis\ntellus. Sed dignissim, metus nec fringilla accumsan,\n risus sem sollicitudin lacus, ut interdum tellus elit sed \nrisus. Maecenas eget condimentum velit, sit amet feugiat lectus.\n Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. \nPraesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar.\n Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem.\n Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                    style: k14lightgery400style,
                  ),
                  SizedBox(
                    height: height,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: numberofQAs,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              question[index],
                              style: k16lightblack600style,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              answer[index],
                              style: k14lightgery400style,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
