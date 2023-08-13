import 'package:dotcoder1/Screens/GroceryShop/homeScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/cartprovider.dart';
import 'Providers/storeprovider.dart';
import 'Screens/GroceryShop/InhomeScreens/NewArrivalScreen.dart';

import 'Screens/GroceryShop/InhomeScreens/categoreyscreen.dart';

import 'Screens/GroceryShop/InhomeScreens/offerforyou.dart';
import 'Screens/GroceryShop/InhomeScreens/topsellings.dart';
import 'Screens/MysplashScreen.dart';
import 'Screens/onboarding/RegisterAccount.dart';
import 'Screens/onboarding/SigninScreen.dart';
import 'Screens/onboarding/Smoothpageindiactor.dart';
import 'Screens/onboarding/forgotpasswordScreen.dart';
import 'Screens/onboarding/newpassword.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => StoreProvider()),
        ],
        child: MaterialApp(
            theme: ThemeData(
              primaryColor: const Color(0xFF07CD6E),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            routes: {
              MyPageView.routename: (context) => const MyPageView(),
              RegistrationScreen.routename: (context) =>
                  const RegistrationScreen(),
              SignInScreen.routename: (context) => const SignInScreen(),
              ForgotScreen.routename: (context) => const ForgotScreen(),
              Newpassword.routename: (context) => const Newpassword(),
              HomeScreen.routename: (context) => const HomeScreen(),
              AllCategory.routename: (context) => AllCategory(),
              // AllStoresscreen.routename: (context) => const AllStoresscreen(),
              OfferListScreen.routename: (context) => OfferListScreen(),
              TopsellingListScreen.routename: (context) =>
                  TopsellingListScreen(),
              NewarrivalListScreen.routename: (context) =>
                  NewarrivalListScreen(),
            }));
  }
}
