import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/donation_fundrise/widgets/fundrise_bottom_card.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/screens/donation_fundrise/donations.dart';

class FundRising extends StatelessWidget {
  const FundRising({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Styles.primary_black,
          appBar: AppBar(
            bottom: const TabBar(
              //  isScrollable: true,
              labelStyle: Styles.RegularText,
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
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
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
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/images/menu_button.svg")),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          body: TabBarView(children: [
                /*  SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Styles.KWidth20,
                category_button(
                    title: 'All',
                    currentIndex: 0,
                ),
                category_button(
                    title: 'Medical',
                    currentIndex: 1,
                ),
                category_button(
                    title: 'Disaster',
                    currentIndex: 2,
                ),
                category_button(
                    title: 'Education',
                    currentIndex: 3,
                ),
              ])), */
            Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 5),  
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
              return donation_card(card_bottom:  card_bottom_fundrise(),bg_image: 'assets/images/blind.jpg', ); 
            },),
          ),
            Text(
              "hello",
              style: Styles.RegularText,
            ),
          ])

         
          ),
    );
  }
}
