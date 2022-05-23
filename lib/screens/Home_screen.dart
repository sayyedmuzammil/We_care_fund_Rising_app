// ignore: unnecessary_import
// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/auth_method.dart';
import 'package:we_care/screens/donate_click/donation_page.dart';
import 'package:we_care/screens/signup_signin/Screen_signup.dart';
import 'package:we_care/screens/signup_signin/screenWelcome.dart';
import 'package:we_care/screens/urgentFundraising.dart';
import 'package:we_care/widgets/carousel_slider.dart';
import 'package:we_care/widgets/category_buttons.dart';
import 'package:we_care/widgets/first_card.dart';
import 'package:we_care/widgets/video_card.dart';

import '../db_functions/controller.dart';
import '../db_functions/firebase.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  init() async {
    await data_control.refreshUser();
    // data_control.update();
    print("in it ${data_control.user!.photoUrl}");
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "WeCare",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            // splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            // visualDensity: null,     

              onPressed: ()  {

                // await AuthMethods().signOut();
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => ScreenWelcome(),
                //   ),
                //   (route) => false,
                // );
              },
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
                    MaterialPageRoute(
                        builder: (context) => UrgentFundraising(
                              title: 'Search',
                            )));
              },
              icon: SvgPicture.asset("assets/images/search_svg.svg")),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/noti_svg.svg")),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/bookmark_svg.svg")),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
     
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: carousel_Slider()),
              Positioned(
                bottom: 3.h,
                left: 40.w,
                child: Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Styles.primary_green,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.w,
                  child: const Text(
                    "Urgent Fundraising ",
                    overflow: TextOverflow.ellipsis,
                    style: Styles.Header,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                  child: FittedBox(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UrgentFundraising(
                                    title: 'Urgent Fundraising',
                                  )),
                        );
                      },
                      child: const Text(
                        "See All",
                        style: Styles.RegularText,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          scrollable_category(),
          SizedBox(
            height: 54.w + 2,
            child: GetX<GetController>(
              builder: (controller) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.fundRiseStream.length,
                  itemBuilder: (context, index) {
                    final data = controller.fundRiseStream[index];
                    print("checking1 $data");
                    return InkWell( 
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => donationScreen(data: data,)),
                          );
                        },
                        child: first_card(
                          data: data,
                          // bg_image: 'assets/images/cloth_poor.jpeg',
                        ));
                  },
                );
              },
            ),
          ),
          Styles.KHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70.w,
                  child: const Text(
                    "Coming to an end",
                    overflow: TextOverflow.ellipsis,
                    style: Styles.Header,
                  ),
                ),
                SizedBox(
                  width: 15.w,
                  child: FittedBox(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UrgentFundraising(
                                    title: 'Coming to an end',
                                  )),
                        );
                      },
                      child: const Text(
                        "See All",
                        style: Styles.RegularText,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 54.w + 2,
            child: GetX<GetController>(
              
              builder: (controller) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.fundRiseStream.length,
                  itemBuilder: (context, index) {
                    final data=controller.fundRiseStream[index];
                    return SizedBox(height: 115, child: first_card(
                      data: data,
                    ));
                  },
                );
              },
            ),
          ),
          Styles.KHeight10,
          SizedBox(
            width: 82.w,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 72.w,
                    child: const FittedBox(
                      child: Text(
                        "Watch the Impact of Your Donation",
                        overflow: TextOverflow.ellipsis,
                        style: Styles.Header,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                    child: FittedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: Styles.RegularText,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const video_card(),
          Styles.KHeight20,
        ],
      ),
    );
  }
}

class scrollable_category extends StatelessWidget {
  const scrollable_category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          category_button(
            title: 'Sick Child',
            currentIndex: 4,
          ),
          category_button(
            title: 'Difable',
            currentIndex: 5,
          ),
          category_button(
            title: 'Others',
            currentIndex: 6,
          ),
        ],
      ),
    );
  }
}
