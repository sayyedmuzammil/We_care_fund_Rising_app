// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/firebase.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screens/donate_click/donators.dart';
import 'package:we_care/widgets/details_tile.dart';

import 'payment_screen.dart';

Padding scroll1(BuildContext context, FundriseModel data) {
// _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.KHeight20,
          SizedBox(
              width: 80.w,
              child: Text(data.title!,
                  style: Styles.Header.copyWith(fontSize: 26))),
          SizedBox(
              height: 22.w,
              width: 100.w,
              child: Details_tile(
                title: data.title!,
                total_fund: data.totalRequireAmount!.toString(),
                raised_fund: data.fundriseAmount!.toString(),
                donators_count: data.donatorsCount!.toString(),
                days_left: calculateExpiryDate(data.expireDate!) + 1,
                // percentWidth: 95,
                widthOfPercent: 95,
                titleVisible: false,
              )),
          Styles.KHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // width: 15.w,
                height: 7.w,
                child: TextButton(
                  child: const Text(
                    'Humanity',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Styles.primary_black,
                    primary: Styles.primary_green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0)),
                    side: const BorderSide(color: Styles.primary_green),
                  ),
                  onPressed: () {
                    // print('Pressed');
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScreenDonators(
                              data: data,
                            )),
                  );
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 55,
                      child: Stack(
                        children: const [
                          Positioned(
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor: Styles.primary_black,
                              radius: 10,
                              backgroundImage: AssetImage(
                                  'assets/images/profile_avatar.png'),
                            ),
                          ),
                          Positioned(
                            right: 22,
                            child: CircleAvatar(
                              backgroundColor: Styles.primary_black,
                              radius: 10,
                              backgroundImage:
                                  AssetImage('assets/images/avatar2.jpg'),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Styles.primary_black,
                            radius: 10,
                            backgroundImage:
                                AssetImage('assets/images/avatar3.jpg'),
                          ),
                        ],
                      ),
                    ),
                    Styles.KHeight10,
                    Text(
                      data.donatorsCount.toString(),
                      style: Styles.RegularText.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.arrow_forward_sharp,
                      color: Styles.primary_green,
                      size: 16,
                    )
                  ],
                ),
              )
            ],
          ),
          Styles.KHeight20,
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 12.w,
                  child: TextButton(
                    child: const Text(
                      'Donate Now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Styles.primary_green,
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0)),
                      side: const BorderSide(color: Styles.primary_green),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PaymentScreen(data: data),
                        ),
                      );

                      print('Pressed');
                    },
                  ),
                ),
              ),
              Styles.KWidth10,
            ],
          ),
        ],
      ));
}
