import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/customappbar.dart';

import '../../../widgets/tabbar_tab/itemtab.dart';
import '../../../widgets/tabbar_tab/mytabindicator.dart';

import '../../../widgets/text/constants.dart';

// ignore: must_be_immutable
class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    _pageController.animateToPage(
      _tabController.index,
      duration: const Duration(milliseconds: 400),
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
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: MYDetailsappbar(
            text: 'My Orders',
            onpressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ))),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        16.0), // Adjust border radius as needed
                    color: const Color(0xffEDF8F0)),
                child: TabBar(
                  controller:
                      _tabController, // Explicitly set the TabController
                  tabs: const [
                    Tab(text: 'Active'),
                    Tab(text: 'Completed'),
                  ],

                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xffACAAAA),
                  labelStyle: k14Grey500style,
                  indicator: CustomTabIndicator(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  active(),
                  completed(),
                ],
                onPageChanged: (index) {
                  _tabController.index = index;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
