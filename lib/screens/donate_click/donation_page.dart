// ignore_for_file: camel_case_types, must_be_immutable, unused_import, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screens/donate_click/scroll1_donate.dart';
import 'package:we_care/screens/donate_click/scroll2_donate.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/new_fundraising.dart';
import 'package:we_care/widgets/details_tile.dart';

class donationScreen extends StatelessWidget {
   fundriseModel data;
  donationScreen({ required this.data});

  List<String> imageList1 = [
    
    'assets/images/srilanka1.jpg',
    'assets/images/srilanka2.jpeg',
    'assets/images/srilanka3.jpg',
    'assets/images/srilanka4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    for (var item in data.childImage!) {
    print("checking donate now $item");
    }

    return 
    // data!=null?
    Scaffold(
      backgroundColor: Styles.primary_black,
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  CarouselSlider(
                      options: CarouselOptions(
                        height: 35.h,
                        viewportFraction: 1,
                        autoPlay: true,
                        disableCenter: false,
                      ),
                      items: data.childImage!/* imageList1 */
                          .map(
                            (item) => SizedBox(
                              width: 100.w,
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .toList()),
                  scroll1(context, data),
                  Styles.KHeight20,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 1,
                    color: const Color(0xFF37424F),
                  ),
                  scroll2(data),
                ],
              ),
            ],
          ),
          Positioned(
            top: 50,
            child: Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: Styles.primary_green,
                      )),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/bookmark_svg.svg"),
                      Styles.KWidth10,
                      SvgPicture.asset("assets/images/bookmark_svg.svg"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )/* :Container(); */;
  }



}
