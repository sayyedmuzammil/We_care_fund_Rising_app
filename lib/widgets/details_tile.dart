
// ignore_for_file: non_constant_identifier_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import 'package:we_care/constant_design.dart';

class Details_tile extends StatelessWidget {
  String title;
  String total_fund;
  String raised_fund;
  String donators_count;
  int days_left;
  int percentWidth;
  bool titleVisible;
   Details_tile({
    required this.title, 
    required this.total_fund,
    required this.raised_fund,
    required this.donators_count,
    required this.days_left,
    this.percentWidth=50,
    this.titleVisible=true,
    
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // top: 4,  
          child: Padding(
            
            padding: const EdgeInsets.symmetric(vertical: 10), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    // width:200,   
                    child: Visibility(
                      visible: titleVisible,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.RegularText.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Visibility(
                  visible: titleVisible,
                  child: Styles.KHeight10),
                SizedBox(
                  width: 80.w,
                  child: Row(
                  
                    children: [
                      Text("₹$raised_fund  ",
                          style: Styles.RegularText.copyWith(
                              fontSize: 12)),
                      Text("fund raised from ₹$total_fund",
                          style: Styles.RegularText.copyWith(
                              fontSize: 12, color: Colors.white)),
                    ],
                  ),
                ),
              Spacer(),
                   
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
          Row(
            
            children: [
              Text(
                "$donators_count  ",
                style:
                    Styles.RegularText.copyWith(fontSize: 12),
              ),
              Text(
                "Donators",
                style: Styles.RegularText.copyWith(
                    fontSize: 12, color: Colors.white),
              ),
            ],
          ),
      Spacer(), 
          FittedBox(
            child: Row(
                  
                 
              children: [
                Text(
                  "$days_left  ",
                  style:
                      Styles.RegularText.copyWith(fontSize: 12),
                ),
                Text(
                  "days left",
                  style: Styles.RegularText.copyWith(
                      fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
            ],
          )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 9.w,     
          left: -10,
          child: 
         FittedBox(
           child: LinearPercentIndicator(
               width: percentWidth.w,            
               animation: true,
               lineHeight: 5.0,
               animationDuration: 1000,
               percent: 0.55,
               barRadius: const Radius.circular(30), 
               progressColor: Styles.primary_green,
             ),
         ),
        ), 
      ],
    );
  }
}
