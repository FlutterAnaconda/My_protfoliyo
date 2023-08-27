import 'package:dotcoder1/widgets/customappbar.dart';
import 'package:dotcoder1/widgets/tabbar_tab/vordertabbar.dart';
import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:dotcoder1/widgets/textfields/butons/Myfilledbutton.dart';
import 'package:flutter/material.dart';

import '../../../../models/saletabmodel.dart';
import '../../../../widgets/tabbar_tab/itemtab.dart';
import '../../../../widgets/tabbar_tab/salestab_tabs.dart';

class Saletab extends StatefulWidget {
  const Saletab({super.key});

  @override
  State<Saletab> createState() => _SaletabState();
}

class _SaletabState extends State<Saletab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  static const List<SalestabModel> stringlist = [
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),
    SalestabModel('images/down.png', 'Withdraw Amount',
        '09th Jan, 2023 -- 11:20AM', ' - \$20.00'),
    SalestabModel(
        'images/down.png', 'Withdraw Amount', '09th Jan, 2023 -- 11:20AM',
        ' - \$20.00'),
    SalestabModel('images/up.png', 'Sales Amount Deposit',
        '09th Jan, 2023 -- 11:20AM', ' + \$500.00'),

  ];

  final List<String> tabs = [
    'All',
    'Sales',
    'Withdraw',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    _pageController.animateToPage(
      _tabController.index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: Mycircleavatarappbar(
            text: 'My Sale',
            imagepath: 'images/Group 7066.png',
            onpressed: () {}),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 160,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      color: const Color(0xffEFF9F2),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        // mainAxisAlignment:MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0, top: 20),
                            child: Text(
                              'Total Amount',
                              style: k18B500style,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0, top: 20),
                            child: Text(
                              '\$1200',
                              style: k24G600style,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/salesdisplay.png',
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),
              VorderTabbar(tabController: _tabController, tabs: tabs),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 340,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    AllSales_withdarw(),
                    Sales(),
                    Withdraw(),
                  ],
                  onPageChanged: (index) {
                    _tabController.index = index;
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: GradientElevatedButton(text: 'Withdraw', onPressed: (){}),
        ),
      ),
    );
  }
  Widget AllSales_withdarw() =>
      ListView.builder(itemCount: stringlist.length,itemBuilder: (context, index) {
        final int color;
        if(stringlist[index].imagepath=='images/up.png')
          {
            color=0xff34A853;
          }
        else
          {
            color=0xffB62D2D;
          }
        return MySalesTabCard(imagepath: stringlist[index].imagepath, maintext: stringlist[index].maintext, datetime: stringlist[index].datetime, amount: stringlist[index].amount, color: color);

      },);

  Widget Sales() =>
      ListView.builder(itemCount: stringlist.length,itemBuilder: (context, index) {

        if(stringlist[index].imagepath !='images/up.png')
        {
          return Container();
        }

        return MySalesTabCard(imagepath: stringlist[index].imagepath, maintext: stringlist[index].maintext, datetime: stringlist[index].datetime, amount: stringlist[index].amount, color: 0xff34A853);

      },);

  Widget Withdraw() =>
      SizedBox(
      height: MediaQuery.of(context).size.height-406,
        child: ListView.builder(itemCount: stringlist.length,itemBuilder: (context, index) {

          if(stringlist[index].imagepath=='images/up.png')
          {
            return Container();
          }

          return MySalesTabCard(imagepath: stringlist[index].imagepath, maintext: stringlist[index].maintext, datetime: stringlist[index].datetime, amount: stringlist[index].amount, color: 0xffB62D2D);

        },),
      );
}



