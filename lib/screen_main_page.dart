
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/bottom_nav_bar.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/controller/dbController.dart';
import 'package:we_care/screens/Home_screen.dart';
import 'package:we_care/screens/Profile.dart';
// import 'package:we_care/screens/chat_screen/chat_box.dart';
import 'package:we_care/screens/donation_fundrise/donations.dart';
import 'package:we_care/screens/donation_fundrise/fund_rising.dart';


class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key, }) : super(key: key);
  // final int indexGet;
  final _pages = [
     const HomeScreen(),
    const Donations(),
    FundRising(),
// ChatBox(), 
     Profile(),
  ];
//  final _dbController= Get.put(DbController());
  @override
  Widget build(BuildContext context) {
  
  //  _dbController.myDonations=[]; 
  //     _dbController.myDonations.clear(); 
  //     _dbController.myFundrise=[]; 
  //  _dbController.myFundrise.clear(); 
    
    Get.put(GetController()).refreshUser();
    Get.put(GetController()).saparatelist();
    // Get.put(DbController()).getDonationDetails();  
    //  Get.put(DbController()).statusFundrise();  
    //  data_control.update();
    // Get.find();

    // Get.put(DbController());
      

    return Scaffold(
      backgroundColor: Styles.primary_black,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            
            builder: (context, int index, _) {
              // index=indexGet;  
              return _pages[index];
            }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
