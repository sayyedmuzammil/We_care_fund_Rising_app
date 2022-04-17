import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/donate_click/donators.dart';
import 'package:we_care/widgets/details_tile.dart';

Padding scroll1(BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.KHeight20,
          SizedBox(
              width: 80.w,
              child: Text('Sri Lankan Economic Crisis',
                  style: Styles.Header.copyWith(fontSize: 26))),
          SizedBox(
              height: 22.w,
              width: 100.w,
              child: Details_tile(
                title: 'Sri Lanka Economic Crisis',
                total_fund: '82,000',
                raised_fund: '66,790',
                donators_count: '3,438',
                days_left: 11,
                percentWidth: 95,
                titleVisible: false,
              )),
          Styles.KHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 15.w,
                height: 7.w,
                child: TextButton(
                  child: const Text(
                    'Medical',
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
                    print('Pressed');
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenDonators()),
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
                      "3,438 donators",
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
