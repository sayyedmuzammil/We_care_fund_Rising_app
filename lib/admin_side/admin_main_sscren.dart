import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/admin_side/home_page_admin.dart';
import 'package:we_care/bottom_nav_bar.dart';
import '../constant_design.dart';
import '../controller/dbController.dart';
import '../controller/dataController.dart';
import '../screens/Profile.dart';
import '../screens/donation_fundrise/donations.dart';
import '../screens/donation_fundrise/fund_rising.dart';

class AdminScreenMain extends StatelessWidget {
  AdminScreenMain({Key? key}) : super(key: key);
  final _pages = [
    const Home_page_admin(),
    Donations(),
    FundRising(),
// ChatBox(), 
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(DbController());
    Get.put(GetController()).refreshUser();
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
