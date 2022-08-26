import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/admin_side/home_page_admin.dart';
import '../controller/dbController.dart';
import '../controller/dataController.dart';

class AdminScreenMain extends StatelessWidget {
  const AdminScreenMain({Key? key}) : super(key: key);
//   final _pages = [
//     const Home_page_admin(),
//     // Donations(),
//     // FundRising(),
// // ChatBox(), 
//     // Profile(),
//   ];
  @override
  Widget build(BuildContext context) {
    Get.put(DbController());
    Get.put(GetController()).refreshUser();
    return const Home_page_admin();
  }
}
