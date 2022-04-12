
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/widgets/details_tile.dart';

class first_card extends StatelessWidget {
  String bg_image;
   first_card({
    required this.bg_image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      alignment: Alignment.topLeft, 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.topCenter,
          width: 50.w,
          height: 55.w,
          color: Styles.primary_black_light,
          child: Column(
            children: [
              Stack(
                children: [
                  //  KWidth20,

                  SizedBox(
                    width: 50.w,
                    height: 25.w,
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child:
                            Image.asset(bg_image)),
                  ),
                  Positioned(
                    right: 3.w,
                    top: 3.w,
                    child: SvgPicture.asset(
                     /*  "assets/images/after Bookmark.svg", */
                     "assets/images/before Bookmark.svg",
                      height: 8.w,
                    ),
                  )
                ],
              ),
              Container(
                height: 29.5.w,     
                width: 52.w,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Details_tile(
                  
                  title: 'Help Orphanage Children to recover',
                  raised_fund: '23,790',
                  total_fund: '42,000',
                  donators_count: '400',
                  days_left: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
