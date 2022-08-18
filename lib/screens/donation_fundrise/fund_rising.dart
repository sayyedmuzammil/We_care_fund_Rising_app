// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:we_care/bottom_nav_bar.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dbController.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/new_fundraising.dart';
import 'package:we_care/screens/donation_fundrise/tab_activity.dart';
import 'package:we_care/screens/donation_fundrise/tab_fundraising.dart';
import '../../screen_main_page.dart';

DateTime date = DateTime.now();
var dateFormated = DateFormat.yMMMMEEEEd().format(date);

class FundRising extends StatelessWidget {
  FundRising({Key? key}) : super(key: key);
  int count = 3;

   final GetController _controller=Get.find();
   final DbController _dbController = Get.put(DbController());
  
  @override
  Widget build(BuildContext context) {

    _dbController.statusFundrise();
    // _controller.saparatelist();
    data_control.categoryButtonClicked.value = 0;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Styles.primary_black,
        appBar: AppBar(
          bottom: const TabBar(
            labelStyle: Styles.RegularTextBold,
            indicatorColor: Styles.primary_green,
            tabs: [
              Tab(
                text: "My Fundraising",
              ),
              Tab(
                text: "Activity",
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Styles.primary_black,
          title: const Text(
            "My Fundraising",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                  indexChangeNotifier.value = 0;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ScreenMainPage(),
                    ),
                    (route) => false,
                  );
                },
                icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset("assets/images/main_logo.svg"),
                ));
          }),
          actions: [
            IconButton(
                onPressed: () {
                  data_control.approvalButton.value = false;
                  data_control.update();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => newFundrising()),
                  );
                },
                icon: SvgPicture.asset("assets/images/draft_icon.svg")),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: TabBarView(children: [
          tab_fundraising(),
          tab_Activity(),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Styles.primary_green,
          onPressed: () {
            data_control.approvalButton.value = false;
            data_control.update();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => newFundrising()),
            );
          },
          tooltip: 'create new fund rising',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
