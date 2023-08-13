import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/constants.dart';

class PolicesScreen extends StatelessWidget {
  final String appbartitle;
  final int numberofQAs;
  final String question;
  final String answer;
  const PolicesScreen(
      {super.key,
      required this.appbartitle,
      required this.numberofQAs,
      required this.question,
      required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MYDetailsappbar(
        text: appbartitle,
        onpressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView.builder(
        itemCount: numberofQAs,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                'This is demo cancelation policy',
                style: k16G600,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing\n elit. Etiam eu turpis molestie, dictum est a, mattis\ntellus. Sed dignissim, metus nec fringilla accumsan,\n risus sem sollicitudin lacus, ut interdum tellus elit sed \nrisus. Maecenas eget condimentum velit, sit amet feugiat lectus.\n Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. \nPraesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar.\n Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem.\n Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                style: k14lightgery400style,
              ),
              Text(
                question,
                style: k16lightblack600style,
              ),
              Text(
                answer,
                style: k14lightgery400style,
              )
            ],
          );
        },
      ),
    );
  }
}
