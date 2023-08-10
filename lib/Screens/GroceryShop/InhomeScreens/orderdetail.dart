import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/tabbar_tab/itemtab.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: MYDetailsappbar(
        text: 'Order Details',
        onpressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 57,
              decoration: containerdecoration,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Text('Delivering', style: k16B600style),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0, bottom: 5),
                      child: Text(
                        'in progress',
                        style: k11_09Grey400style,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: 24,
                          width: 120,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xff07CD6E),
                                const Color(0xff059F55).withOpacity(0.86),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Text(
                            'Cash On Delivery',
                            style: k12w400interstyle,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                'Information',
                style: k16B600style,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: Container(
                decoration: containerdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Order ID:",
                            style: k14B400interstyle,
                          ),
                          const Spacer(),
                          Text(
                            "#458758",
                            style: k12_94G400style,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Divider(
                          color: Color(0xffEBEBF0),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Order Date",
                            style: k14B400interstyle,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "09th Jan, 2023 -- 11:20AM",
                              style: k11_09Grey400style,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 230, child: items()),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: GradientElevatedButton(
                onPressed: () {},
                text: 'Track Order',
              ),
            )
          ],
        ),
      ),
    ));
  }
}
