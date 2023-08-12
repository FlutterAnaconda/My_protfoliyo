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
        // backgroundColor: const Color(0xff23AA49).withOpacity(0.12),
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
                decoration: cardcontainerdecoration,
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
                      buttoncontainer(30, 'Cash on delivery')
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
                  decoration: cardcontainerdecoration,
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Store Details',
                  style: k16B600style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  height: 69,
                  width: MediaQuery.of(context).size.width,
                  decoration: cardcontainerdecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('images/Group 7066.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "Balzing Store",
                                  style: k12B600style,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: Color(0xff737373),
                                    size: 15,
                                  ),
                                  Text(
                                    'Location',
                                    style: k12lightGrey400style,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 44,
                        ),
                        buttoncontainer(5, 'Message'),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 125,
                width: 370,
                decoration: cardcontainerdecoration,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Details', style: k18G600style),
                      Row(
                        children: [
                          Text(
                            'Delivery Free for 3.6kms',
                            style: k14lightblack400style,
                          ),
                          const Spacer(),
                          Text(
                            '+\$12.70',
                            style: k14lightblack400style,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Shipping fee',
                            style: k14lightblack400style,
                          ),
                          const Spacer(),
                          Text('+\$12.70', style: k14lightblack400style),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Total',
                            style: k18lightgrey600style,
                          ),
                          const Spacer(),
                          Text(
                            '\$34.70',
                            style: k18lightgrey600style,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GradientElevatedButton(
          onPressed: () {},
          text: 'Track Order',
        ),
      ),
    );
  }

  Widget buttoncontainer(double radius, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
          height: 24,
          width: 120,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            gradient: LinearGradient(
              colors: [
                const Color(0xff00FF85),
                const Color(0xff059F55).withOpacity(0.86),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(
            text,
            style: k12w400interstyle,
          )),
    );
  }
}
