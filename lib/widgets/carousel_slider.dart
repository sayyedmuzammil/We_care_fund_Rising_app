// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/controller/dbController.dart';

class carousel_Slider extends StatelessWidget {
  carousel_Slider({
    Key? key,
  }) : super(key: key);

  // final DbController _dbController = Get.find();

  List<Map<String, dynamic>> imageList = [
    {
      'title': 'Help Alice Brain Surgery',
      'image': 'assets/images/alice fund rising.jpeg',
    },
    {
      'title': 'Help Ocean',
      'image': 'assets/images/alice fund rising.jpeg',
    },
  ];
  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<GetController>(
      // init: DbController(),
     
      builder: (_dbController) {
        
         int random = Random().nextInt(_dbController.carousilFundrise.length+1);
        return CarouselSlider(

            options: CarouselOptions(

              initialPage: random,
              viewportFraction: 1,
              autoPlay: true,
              disableCenter: false,
              
            ),
            items: _dbController.carousilFundrise
                .map(
                  (item) => Stack(
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 25.h,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(item.mainImage!))),
                      ),
                      Positioned(
                          bottom: 40,
                          left: 20,
                          child: Text(
                            item.title!,
                            style: Styles.Header,
                          ))
                    ],
                  ),
                )
                .toList());
      },
    );
  }
}
