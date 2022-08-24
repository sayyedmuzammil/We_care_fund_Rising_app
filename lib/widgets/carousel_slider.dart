// ignore_for_file: camel_case_types, must_be_immutable

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';

class carousel_Slider extends StatelessWidget {
  carousel_Slider({
    Key? key,
    required this.carousilFundrise,
  }) : super(key: key);

  List<FundriseModel> carousilFundrise;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<GetController>(
      builder: (_dbController) {
        // int random =
        //     Random().nextInt(_dbController.carousilFundrise.length + 1);
        return Stack(
          children: [
            SizedBox(
              height: 25.h,
              width: 100.w,
              child: Swiper(
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                ),

                autoplay: true,
                itemCount: carousilFundrise.length,

                itemBuilder: (context, index) {
                  if (carousilFundrise.isEmpty) {
                    return const CircularProgressIndicator(); 
                  } else {
                
                    return Stack(
                      children: [
                        SizedBox(
                          width: 100.w,
                          height: 25.h,
                          child: FittedBox(
                              fit: BoxFit.fill,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(carousilFundrise[index]
                                      .mainImage
                                      .toString()))),
                        ),
                        Positioned(
                            bottom: 40,
                            left: 20,
                            child: Text(
                              carousilFundrise[index].title.toString(),
                              style: Styles.Header,
                            ))
                      ],
                    );
                  }
                },
                  ),
            ),
                // carouselController: _Controller,
                /*  options: CarouselOptions(
            
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
                      .toList() */
            
            /*       Positioned(
                bottom: 3.h,
                left: 0.w,   
                child: Container( 
                  height: 8, 
                  width: 100.w, 
                  // color: Colors.red,  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      Container(
                        
                       height: 10 ,    
                       width: 90,
                       // alignment: Alignment.,     
                      //  color: Colors.blue, 
                          child: ListView.builder(
                         
                          itemCount: _dbController.carousilFundrise.length,   
                          
                          scrollDirection: Axis.horizontal, 
                          itemBuilder: (ctx, index){
                            print("6666 ${count++}");  
                            return Row(
                              children: [
                                Container(
                                  alignment: Alignment.bottomLeft,  
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Styles.primary_green,
                                  ),
                                ),
                                Styles.KWidth10,  
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      */
          ],
        );
      },
    );
  }
}
