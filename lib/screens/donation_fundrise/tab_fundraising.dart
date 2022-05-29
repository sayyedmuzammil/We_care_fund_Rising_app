// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/myDonationController.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/screens/donation_fundrise/widgets/fundrise_bottom_card.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/widgets/category_buttons.dart';
Padding tab_fundraising(count) {
  //  final MyDonationController  _myDonationController=Get.put(MyDonationController());
final PageController controller = PageController();
int pageViewIndex = 0;
  return Padding(
    
    padding: const EdgeInsets.only(left: 0, right: 0),
    child: Column(
      children: [
        Styles.KHeight10,
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Styles.KWidth20,
                  category_button(
                    title: 'All(9)',
                    currentIndex: 0,
                    controller: controller,
                  ),
                  category_button(
                    title: 'On Going($count)',
                    currentIndex: 1, 
                    controller: controller,
                  ),
                  category_button(
                    title: 'Past($count)',
                    currentIndex: 2,
                    controller: controller,
                  ),
                  category_button(
                    title: 'Pending($count)',
                    currentIndex: 3,
                    controller: controller,
                  ),
                   category_button(
                    title: 'Rejected($count)',
                    currentIndex: 4,
                    controller: controller, 
                  ),
                ])
                
                ),
                 
     Expanded(
       child: GetBuilder<MyDonationController>(
         
         builder: (_controller) {
       
           return PageView(
             controller: controller,
             onPageChanged:(value) {
               data_control.categoryButtonClicked.value= value;
              
             },
            children: [
                   ListView.builder(
                    itemCount: _controller.myFundrise.length,
                    itemBuilder: (context, index) {
                    final data = _controller.myFundrise[index];
                    return donation_card(
                               data: data,
                             card_bottom:  card_bottom_fundrise(data: data,),
                             // bg_image: data.mainImage!,
                           );
                  },),
                  ListView.builder(
                    itemCount: _controller.publishedFundrise.length,
                    itemBuilder: (context, index) {
                    final data = _controller.publishedFundrise[index];
                    return donation_card(
                               data: data,
                             card_bottom:  card_bottom_fundrise(data: data,),
                             // bg_image: data.mainImage!,
                           );
                  },),

                  ListView.builder(
                    itemCount: _controller.completedFundrise.length,
                    itemBuilder: (context, index) {
                    final data = _controller.completedFundrise[index];
                    return donation_card(
                               data: data,
                             card_bottom:  card_bottom_fundrise(data: data,),
                             // bg_image: data.mainImage!,
                           );
                  },),
                  ListView.builder(
                    itemCount: _controller.reviewFundrise.length,
                    itemBuilder: (context, index) {
                    final data = _controller.reviewFundrise[index];
                    return donation_card(
                               data: data,
                             card_bottom:  card_bottom_fundrise(data: data,),
                             // bg_image: data.mainImage!,
                           );
                  },),
                  
                  ListView.builder(
                    itemCount: _controller.rejectedFundrise.length,
                    itemBuilder: (context, index) {
                    final data = _controller.rejectedFundrise[index];
                    return donation_card(
                               data: data,
                             card_bottom:  card_bottom_fundrise(data: data,),
                             // bg_image: data.mainImage!,
                           );
                  },),
                  
                  
                  ]
                ,
               /// [PageView.scrollDirection] defaults to [Axis.horizontal].
               /// Use [Axis.vertical] to scroll vertically.
              
                ); 
         },
       ),
     ),
      /*   Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: StreamBuilder<List<fundriseModel>>(
              stream:    getFundrise(),
              builder: (context, snapshot) {
                List<fundriseModel> myFundriseData=[];
               
               if(snapshot.data != null){
                 for (var item in snapshot.data!) {

                   if(item.userId==data_control.user!.userId && item.status=='publish'){
                        myFundriseData.add(item);
                   }
                   
                 }
                return  ListView.builder(
                  itemCount: myFundriseData.length,
                  itemBuilder: (context, index) {
                    final data=myFundriseData[index];
                  // print("${snapshot.data![index].status}");

                      return donation_card(
                        data: data,
                      card_bottom:  card_bottom_fundrise(data: data,),
                      // bg_image: data.mainImage!,
                    );
                  },
                );
               }
               else{
                 return Center( child: Text("No data"));
               }
              }
            ),
          ),
        ),
       */
      ],
    ),
  );
}
