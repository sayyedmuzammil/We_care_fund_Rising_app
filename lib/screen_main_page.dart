// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/bottom_nav_bar.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/screens/Home_screen.dart';
import 'package:we_care/screens/Profile.dart';
import 'package:we_care/screens/donation_fundrise/donations.dart';
import 'package:we_care/screens/donation_fundrise/fund_rising.dart';

import 'controller/dbController.dart';

class ScreenMainPage extends StatelessWidget {
  int indexGett;
  ScreenMainPage({Key? key, this.indexGett = 0}) : super(key: key);
  final _pages = [
     HomeScreen(),
    Donations(),
    FundRising(),
// ChatBox(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    print('main 1');
    Get.put(DbController()).getDonationDetails();
    Get.put(GetController()).refreshUser();
    
    // Get.put(DbController());
  

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
