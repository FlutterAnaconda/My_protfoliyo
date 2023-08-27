import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';

class VorderTabbar extends StatelessWidget {
    TabController tabController ;
   final List tabs;
   VorderTabbar({super.key,required this.tabController, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return   ButtonsTabBar(
      // Customize the appearance and behavior of the tab bar
      backgroundColor: const Color(0xffEFF9F1),

      borderWidth: 1,
      contentPadding: const EdgeInsets.symmetric(horizontal: 18),
      buttonMargin:const EdgeInsets.symmetric(horizontal: 5),
      borderColor: Colors.transparent,
      controller: tabController,
      height: 30,
      splashColor: const Color(0xff34A853).withOpacity(0.1),
      unselectedBackgroundColor: Colors.white,
      unselectedBorderColor: const Color(0xffE8ECF2),
      labelStyle:  GoogleFonts.poppins(
          color: const Color(0xff34A853),
          fontWeight: FontWeight.w400,
          fontSize: 12
      ),
      unselectedLabelStyle:  GoogleFonts.poppins(
          color:const Color(0xff888888),
          fontWeight: FontWeight.w400,
          fontSize: 12
      ),
      // Add your tabs here
      tabs: tabs.map((tab) {
        return Tab(

          text: tab,

        );
      }).toList(),
    );
  }
}
