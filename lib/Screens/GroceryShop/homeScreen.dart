import 'package:flutter/material.dart';

import 'Bottomtab/Storetab.dart';
import 'Bottomtab/cart.dart';
import 'Bottomtab/hometab.dart';
import 'Bottomtab/order.dart';
import 'Bottomtab/profiletab.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchcontroller = TextEditingController();
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const HomeTab(),
    const OrderTab(),
    const StoreTab(),
    const CartScreen(
      cartItems: [],
    ),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor:
              Theme.of(context).primaryColor, // Color for the active tab item.
          unselectedItemColor: Colors.grey, // Color for the inactive tab items.
          showUnselectedLabels:
              true, // Set this to false to hide the inactive tab labels.
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                  _currentIndex == 0
                      ? 'images/homefill.png'
                      : 'images/home-2.png',
                  height: 24,
                  width: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  _currentIndex == 1
                      ? 'images/orderfill.png'
                      : 'images/clipboard-text.png',
                  height: 24,
                  width: 24),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon:
                  Image.asset('images/menu - home.png', height: 50, width: 50),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  _currentIndex == 3
                      ? 'images/cartfill.png'
                      : 'images/Vector.png',
                  height: 24,
                  width: 24),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  _currentIndex == 4
                      ? 'images/settingicons/setting-2.png'
                      : "images/settingicons/setting.png",
                  height: 24,
                  width: 24),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}

// Rest of the tab classes remain unchanged

