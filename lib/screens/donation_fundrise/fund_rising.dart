// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/new_fundraising.dart';
import 'package:we_care/screens/donation_fundrise/tab_activity.dart';
import 'package:we_care/screens/donation_fundrise/tab_fundraising.dart';
DateTime date=DateTime.now();
var dateFormated=  DateFormat.yMMMMEEEEd().format(date);     
class FundRising extends StatelessWidget {
  FundRising({Key? key}) : super(key: key);
  int count = 3;
  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset("assets/images/main_logo.svg"),
                ));
          }),
          actions: [
            IconButton(
                onPressed: () {
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
          tab_fundraising(count),
          tab_Activity('assets/images/hungry_kid.jpg', dateFormated),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Styles.primary_green,
          onPressed: () {
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