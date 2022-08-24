// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/bottom_nav_bar.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dbController.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screen_main_page.dart';
import 'package:we_care/screens/donate_click/payment_screen.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';

import '../../widgets/appbar_main.dart';

class Donations extends StatelessWidget {
  Donations({Key? key}) : super(key: key);
  final DbController _dbController = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    print("Donation nav");
    _dbController.getDonationDetails();
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: Appbar_main(context,false,   
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
                    card_bottom: card_bottom(
                        amount: controller.donationData[index].amount,
                        data: controller.myDonations[index]),
                    // bg_image: 'assets/images/shelter_video_bg.jpg',
                  );
                },
              );
            }
          })),
    );
  }
}

class card_bottom extends StatelessWidget {
  int? amount;
  FundriseModel data;
  card_bottom({
    required this.data,
    this.amount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("You have donated",
                  style: Styles.RegularText.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white)),
              Text(" ₹$amount",
                  style: Styles.RegularText.copyWith(
                      fontSize: 12, color: Styles.primary_green)),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
                child: FittedBox(
                  child: TextButton(
                    child: const Text(
                      'Donate Again',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.primary_black,
                      primary: Styles.primary_green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      side: const BorderSide(color: Styles.primary_green),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PaymentScreen(
                            data: data,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
