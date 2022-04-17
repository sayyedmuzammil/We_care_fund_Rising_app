
// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/widgets/details_tile.dart';

class donation_card extends StatelessWidget {
  Widget?  card_bottom;
  String bg_image;
   donation_card({
     required this.bg_image, 
     this.card_bottom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15,left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Styles.primary_green_light, width: 2),
          color: Styles.primary_black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 50.w,
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Styles.KHeight10,
              main_childCard(bg_image: bg_image),
              card_bottom!=null?
             card_bottom!
             :Container(),
           
            ],
          ),
        ),
      ),
    );
  }
}

class main_childCard extends StatelessWidget {
  const main_childCard({
    Key? key,
    required this.bg_image,
  }) : super(key: key);

  final String bg_image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.w,
      width: 82.w,
      decoration: BoxDecoration(
        color: Styles.primary_black_light,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20)),
                child: SizedBox(
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(
                          bg_image)),
                  height: 100.w,
                  width: 30.w,
                ),
              ),
              Positioned(
                right: 3.w,
                top: 3.w,
                child: SvgPicture.asset(
                  "assets/images/before Bookmark.svg",
                  height: 8.w,
                ),
              ),
            ],
          ),
          Container(
              height: 30.w,
              width: 52.w,
               padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Details_tile(
                title: "Help Victims of Flash Flood",
                total_fund: '1,05,400',
                raised_fund: '87,750',
                donators_count: '4,471',
                days_left: 9,
              )),
        ],
      ),
    );
  }
}

