// ignore: unnecessary_import
// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/donate_click/donation_page.dart';
import 'package:we_care/screens/urgentFundraising.dart';
import 'package:we_care/widgets/carousel_slider.dart';
import 'package:we_care/widgets/category_buttons.dart';
import 'package:we_care/widgets/first_card.dart';
import '../controller/dataController.dart';
import '../widgets/appbar_main.dart';

class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);

   
  @override
  Widget build(BuildContext context) {
    print("Home");
    return Scaffold( 
      backgroundColor: Styles.primary_black,
      appBar: Appbar_main(context,true,   IconButton(
        
              onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.topToBottom,
                        child: UrgentFundraising(
                              title: 'Search',
                              fundraiseData: data_control.publishedFundriseAll,
                            ),
                      )
                  );
              },
              icon: SvgPicture.asset("assets/images/search_svg.svg")),
              ),
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: carousel_Slider(carousilFundrise: data_control.carousilFundrise)),
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
                                    fundraiseData: data_control.urgentFundrise,
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
            height: 55.w,
            child: GetBuilder<GetController>
             /*  builder: (controller) {
                // controller.saparatelist();
                return */(
                  builder: (controller){
              
                   return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data_control.urgentFundrise.length,
                  itemBuilder: (context, index) {
                    final data = data_control.urgentFundrise[index];
                     if (data_control.urgentFundrise.isEmpty) {
                    return CircularProgressIndicator(); 
                  } else {
                    return SizedBox(
                        height: 115,
                        child: GestureDetector(
                          onTap: () {
                            
                      Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: donationScreen(data:data_control.urgentFundrise[index],),
                  ),
                );
                          },
                          child: first_card(
                            data: data,
                          ),
                        ));
                  }
                  },
                ); 
                  }
              
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
                                    fundraiseData: data_control.endingFundrise,
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
            height: 55.w,
             child: GetBuilder<GetController>(
              // builder: (controller) {
                // List<FundriseModel> endingFundrise = [];
                // for (var item in controller.fundRiseStream) {
                //   final dayLeft = calculateExpiryDate(item.expireDate!);
                //   if (dayLeft <= 3 && dayLeft >= 0) {
                //     endingFundrise.add(item);
                //   }
                // }
                // controller.saparatelist();
                builder: (controller){
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data_control.endingFundrise.length,
                  itemBuilder: (context, index) {
                    final data = data_control.endingFundrise[index];
                    return SizedBox(
                        height: 115,
                        child: GestureDetector(
                           onTap: () {
                            
                      Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: donationScreen(data: data_control.endingFundrise[index],),
                  ),
                );
                          },
                          child: first_card(
                            data: data,
                          ),
                        ));
                  },
                );
                }
              
            ),
          ),
          Styles.KHeight10,
        /*   SizedBox(
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
          Styles.KHeight20, */
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
