// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/db_functions/firebase.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/screens/Home_screen.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'donation_fundrise/new_fundrise/new_fundraising.dart';

class UrgentFundraising extends StatelessWidget {
  String title;


  final _searchController = TextEditingController();
  UrgentFundraising({
    this.title = 'Urgent Fundraising',
  
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:  BottomNavigationWidget(),
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Styles.primary_green,
                    )),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80.w,
                  child: text_field(
                    Text_field_controller: _searchController,
                    hintText: 'Search',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 22,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/images/filter_icon.svg")),
              ],
            ),
          ),
          Styles.KHeight10,
          const scrollable_category(),
          Expanded(
            child: Padding(

              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: /* StreamBuilder<List<fundriseModel>>(
                stream: getFundrise(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if(snapshot.data!=null){ */
                   GetX<GetController>(
                    //  init: funController(),
                    //  initState: (_) {},
                     builder: (controller) {
                       return ListView.separated(
                                       separatorBuilder: (context, index) => Styles.KHeight10,
                                       itemCount: controller.fundRiseStream.length,
                                       itemBuilder: (context, index) {
                                         final data=controller.fundRiseStream[index];
                                         return main_childCard(
                                           data: data,
                                          
                                         );
                                       },
                                      
                                     ); 
                     },
                   ), 
              //  }
              //  else return Center(child: Text("No Data"),);
              //   }
              // ),
            ),
          ),
          Styles.KHeight20,
        ],
      ),
    );
  }
}
