// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dbController.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/screens/donation_fundrise/widgets/fundrise_bottom_card.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/widgets/category_buttons.dart';

Padding tab_fundraising() {
  final _dbController=Get.put(DbController());
  //  final MyDonationController  _myDonationController=Get.put(MyDonationController());
  final PageController controller = PageController();
 
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 0),
    child: _dbController.myDonations.isEmpty?Center(
                  child: Image.asset('assets/images/No result icon.png'))
                  : Column(
      children: [
        Styles.KHeight10,
        
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Styles.KWidth20,
                  category_button(
                    title: 'All',
                    currentIndex: 0,
                    controller: controller,
                  ),
                  category_button(
                    title: 'On Going',
                    currentIndex: 1,
                    controller: controller,
                  ),
                  category_button(
                    title: 'Past',
                    currentIndex: 2,
                    controller: controller,
                  ),
                  category_button(
                    title: 'Pending',
                    currentIndex: 3,
                    controller: controller,
                  ),
                  category_button(
                    title: 'Rejected',
                    currentIndex: 4,
                    controller: controller,
                  ),
                ])),
        Expanded(
          child: GetBuilder<DbController>(
            builder: (_controller) {
              
              return PageView(
                controller: controller,
                onPageChanged: (value) {
                  data_control.categoryButtonClicked.value = value;
                },
                children: [
                  ListView.builder(
                    itemCount: _controller.myFundrise.length,
                    itemBuilder: (context, index) {
                      final data = _controller.myFundrise[index];
                      return donation_card(
                        data: data,
                        card_bottom: card_bottom_fundrise(
                          data: data,
                        ),
                        // bg_image: data.mainImage!,
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: _controller.publishedFundrise.length,
                    itemBuilder: (context, index) {
                      final data = _controller.publishedFundrise[index];
                      return donation_card(
                        data: data,
                        card_bottom: card_bottom_fundrise(
                          data: data,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: _controller.completedFundrise.length,
                    itemBuilder: (context, index) {
                      final data = _controller.completedFundrise[index];
                      return donation_card(
                        data: data,
                        card_bottom: card_bottom_fundrise(
                          data: data,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: _controller.reviewFundrise.length,
                    itemBuilder: (context, index) {
                      final data = _controller.reviewFundrise[index];
                      return donation_card(
                        data: data,
                        card_bottom: card_bottom_fundrise(
                          data: data,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: _controller.rejectedFundrise.length,
                    itemBuilder: (context, index) {
                      final data = _controller.rejectedFundrise[index];
                      return donation_card(
                        data: data,
                        card_bottom: card_bottom_fundrise(
                          data: data,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ),
  );
}
