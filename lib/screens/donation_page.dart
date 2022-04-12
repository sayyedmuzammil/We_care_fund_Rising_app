// ignore_for_file: camel_case_types, must_be_immutable, unused_import

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/widgets/details_tile.dart';

class donationScreen extends StatelessWidget {
  donationScreen({Key? key}) : super(key: key);

  List<String> imageList1 = [
    'assets/images/srilanka1.jpg',
    'assets/images/srilanka2.jpeg',
    'assets/images/srilanka3.jpg',
    'assets/images/srilanka4.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                height: 35.h,
                // enlargeStrategy: CenterPageEnlargeStrategy.scale,
                viewportFraction: 1,
                // enlargeCenterPage: true,
                autoPlay: true,
                disableCenter: false,
              ),
              items: imageList1
                  .map(
                    (item) => SizedBox(
                      width: 100.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                          )),
                    ),
                  )
                  .toList()),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.KHeight20, 
                const Text('Sri Lanka Economic Crisis', style: Styles.Header, ),
               
                SizedBox(
                    height: 22.w,       
                width: 100.w,    
                  child: Details_tile(title: 'Sri Lanka Economic Crisis', total_fund: '82,000', raised_fund: '66,790', donators_count: '3,438', days_left: 11, percentWidth: 95,titleVisible: false,)),
             Container(color: Colors.red, height: 50,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
