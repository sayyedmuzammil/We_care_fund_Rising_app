// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_care/constant_design.dart'; 
import 'package:we_care/controller/dbController.dart';
import 'package:we_care/screens/donate_click/payment_screen.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';

import '../../widgets/appbar_main.dart';
import 'widgets/card_bottom_donation.dart';

class Donations extends StatelessWidget {
  const Donations({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      Get.put(DbController()); 
    // _dbController.getDonationDetails();
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: appBarMain(
        context,
        "My Donations",
        false,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
          child: /* ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return donation_card(
              card_bottom: card_bottom(),
              bg_image: 'assets/images/shelter_video_bg.jpg',
            );
          },
        ), */
              GetBuilder<DbController>(
                  //  id: 'donations',
                  builder: (controller) {
            if (controller.myDonations.isEmpty) {
              return Center(
                  child: Image.asset('assets/images/No result icon.png'));
            } else {
              return ListView.builder(
                itemCount: controller.myDonations.length,
                itemBuilder: (context, index) {
                  return donation_card(
                    data: controller.myDonations[index],
                    card_bottom: CardBottom(
                      amount: controller.donationData[index].amount,
                      // data: controller.myDonations[index],
                      buttonText: "Donate Again",
                      clickResult: PaymentScreen(
                        data: controller.myDonations[index],
                      ),
                    ),

                    // bg_image: 'assets/images/shelter_video_bg.jpg',
                  );
                },
              );
            }
          })),
    );
  }
}
