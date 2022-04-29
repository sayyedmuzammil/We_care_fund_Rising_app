import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/bottom_nav_bar.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screen_main_page.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/widgets/category_buttons.dart';

import '../../db_functions/firebase.dart';

class Donations extends StatelessWidget {
  const Donations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "My Donation",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                indexChangeNotifier.value = 0;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ScreenMainPage(),
                  ),
                  (route) => false,
                );
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset("assets/images/main_logo.svg"),
              ));
        }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/menu_button.svg")),
          const SizedBox(
            width: 15,
          ),
        ],
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
         StreamBuilder<List<fundriseModel>>(
              stream:    getFundrise(),
              builder: (context, snapshot) {
                
               
               if(snapshot.data != null){
                return  ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data=snapshot.data![index];
                  // print("${snapshot.data![index].status}");

                    return donation_card(
                      data:  data,
              card_bottom: card_bottom(),
              bg_image: data.mainImage!,
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
    );
  }
}

class card_bottom extends StatelessWidget {
  const card_bottom({
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
              Text(" ₹220",
                  style: Styles.RegularText.copyWith(
                      fontSize: 12, color: Styles.primary_green)),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 25.w,
                child: FittedBox(
                  child: category_button(
                    title: 'Donate Again',
                    currentIndex: 7,
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
