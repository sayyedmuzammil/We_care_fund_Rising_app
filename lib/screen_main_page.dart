import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/bottom_nav_bar.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/screens/Home_screen.dart';
import 'package:we_care/screens/Profile.dart';
import 'package:we_care/screens/donation_fundrise/donations.dart';
import 'package:we_care/screens/donation_fundrise/fund_rising.dart';

class ScreenMainPage extends StatelessWidget {
  
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    const HomeScreen(),
    const Donations(),
    FundRising(),
// ChatBox(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
  Get.put(GetController());
    return Scaffold(
      backgroundColor: Styles.primary_black,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
