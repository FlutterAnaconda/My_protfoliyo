import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../../../models/paymentmethod.dart';
import '../../../widgets/text/constants.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  static const List<PaymentMethodModel> list = [
    PaymentMethodModel('images/loc.png', 'Road falana Street falana'),
    PaymentMethodModel('images/call.png', '0314548454845'),
    PaymentMethodModel('images/sms.png', 'supprot@gmail.com'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
      appBar: MYDetailsappbar(
        text: 'Help & Support',
        onpressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'images/helpsupport.png',
              height: 307,
              width: 307,
            ),
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
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Image.asset(
                                  list[index].imageurl,
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index].text,
                                      style: k12Grey400style,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      height: 1,
                                      width: 209,
                                      color: const Color(0xffEBEBF0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
