
// ignore_for_file: non_constant_identifier_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/firebase.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/widgets/details_tile.dart';

class first_card extends StatelessWidget {
  FundriseModel data;
   first_card({
    required this.data, 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      alignment: Alignment.topLeft, 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.topCenter,
          width: 50.w,
          height: 55.w,
          color: Styles.primary_black_light,    
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 50.w, 
                    height: 25.w,               
                    child: FittedBox(
                        fit: BoxFit.fitWidth,    
                        child:
                            Image.network(data.mainImage!)),
                  ),
                  Container(
                alignment: Alignment.bottomCenter, 
                height: 29.5.w,              
                width: 52.w,
                color: Styles.primary_black_light, 
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Details_tile(
                  
                  title: data.title!,
                  raised_fund: data.fundriseAmount.toString(),
                  total_fund: data.totalRequireAmount.toString(),
                  donators_count: data.donatorsCount.toString(),
                  days_left: calculateExpiryDate(data.expireDate!)+1,
                ),
              ), 
                ],
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
        ),
      ),
    );
  }
}
