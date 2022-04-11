import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:we_care/constant_design.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("start $indexChangeNotifier");
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            iconSize: 25,
            // selectedFontSize: 8,
            unselectedFontSize: 8,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            currentIndex: newIndex,
            elevation: 10, 
            type: BottomNavigationBarType.fixed,
            backgroundColor:Styles.primary_black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: [
              BottomNavigationBarItem(
                  icon: newIndex != 0
                      ? SvgPicture.asset(
                          "assets/images/nav_icons/home_green.svg")
                      : SvgPicture.asset(
                          "assets/images/nav_icons/home_white.svg"),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: newIndex != 1
                      ? SvgPicture.asset(
                          "assets/images/nav_icons/donation_green.svg")
                      : SvgPicture.asset(
                          "assets/images/nav_icons/donation_white.svg"),
                  label: 'donation'),
              BottomNavigationBarItem(
                  icon: newIndex != 2
                      ? SvgPicture.asset(
                          "assets/images/nav_icons/fundrise_green.svg")
                      : SvgPicture.asset(
                          "assets/images/nav_icons/fundrise_white.svg"),
                  label: 'fund Rise'),
              // BottomNavigationBarItem(
              //     icon: newIndex != 3
              //         ? SvgPicture.asset(
              //             "assets/images/nav_icons/chat_green.svg")
              //         : SvgPicture.asset(
              //             "assets/images/nav_icons/chat_white.svg"),
              //     label: 'chat Box'),
              BottomNavigationBarItem(
                  icon: newIndex != 3
                      ? SvgPicture.asset(
                          "assets/images/nav_icons/profile_green.svg")
                      : SvgPicture.asset(
                          "assets/images/nav_icons/profile_white.svg"),
                  label: 'profile'),
            ],
          );
        });
  }
}
