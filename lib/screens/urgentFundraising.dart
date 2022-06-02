// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/screens/Home_screen.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/widgets/appBarHead.dart';
import '../widgets/textField.dart';

class UrgentFundraising extends StatelessWidget {
  String title;
  String page;
  final _searchController = TextEditingController();
  UrgentFundraising({
    this.page='urgent',
    this.title = 'Urgent Fundraising',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBarHead('Search'), 
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
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
          // const scrollable_category(),
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
                  
                     builder: (controller) {
                       return ListView.separated(
                                       separatorBuilder: (context, index) => Styles.KHeight10,
                                       itemCount: page=='urgent'? controller.urgentFundrise.length:page=='end'? controller.endingFundrise.length:controller.publishedFundriseAll.length,
                                       itemBuilder: (context, index) {
                                         final data=page=='urgent'? controller.urgentFundrise[index]:page=='end'? controller.endingFundrise[index]:controller.publishedFundriseAll[index];
                                         return main_childCard(
                                           data: data,
                                          
                                         );
                                       },
                                      
                                     ); 
                     },
                   ), 
            
            ),
          ),
          Styles.KHeight20,
        ],
      ),
    );
  }
}
