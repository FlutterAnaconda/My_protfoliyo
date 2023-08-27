import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/usertype.dart';
import '../../../models/paymentmethod.dart';
import '../../../widgets/text/constants.dart';
import '../../../widgets/textfields/butons/Myfilledbutton.dart';
import 'SubscribtionScreen.dart';

class PlanScreen extends StatefulWidget {
  final VoidCallback onslide;

  const PlanScreen({super.key, required this.onslide});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  static const List<PaymentMethodModel> list = [
    PaymentMethodModel('images/subscribe.png', 'Subscription Base'),
    PaymentMethodModel('images/commission.png', 'Commission Base'),
  ];

  int selectedindex = -1;
  bool issub = false;

  @override
  Widget build(BuildContext context) {
    final package = Provider.of<Usertype>(context);

    return Scaffold(
      body: package.baseindex == 1
          ? const SubscribtionScreen()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Choose Business Plan",
                      style: k14B600style,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: SizedBox(
                      height: 160,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 64,
                              width: 342,
                              decoration: cardcontainerdecoration,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(width: 10,),
                                  Image.asset(
                                    list[index].imageurl,
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(
                                    list[index].text,
                                    style: k14darkGrey300style,
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedindex = index;
                                        });

                                        // print(selectedindex);
                                      },
                                      child: Container(
                                        height: 28,
                                        width: 28,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              width: 2,
                                              color:
                                                  Theme.of(context).primaryColor,
                                            )),
                                        child: selectedindex == index
                                            ? Icon(
                                                Icons.circle,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 18,
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Overview",
                      style: k14B600style,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, ',
                      style: k14Grey300style,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GradientElevatedButton(
            text: 'Next',
            onPressed: () {
              setState(() {
                package.choosebase(selectedindex + 1);
                if (package.baseindex == 2 || package.subscribe!) {
                  widget.onslide();
                }
              });

              // package.subscribe! || selectedindex==1 ? widget.onslide() :Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SubscribtionScreen(),));
            }),
      ),
    );
  }
}
