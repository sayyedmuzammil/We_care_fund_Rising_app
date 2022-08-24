// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/screens/donation_fundrise/widgets/main_card.dart';
import 'package:we_care/widgets/appBarHead.dart';
import '../db_functions/fundRiseModel.dart';
import '../widgets/textField.dart';

class UrgentFundraising extends StatelessWidget {
  String title;
  final List<FundriseModel> fundraiseData;
  final _searchController = TextEditingController();
  UrgentFundraising({
    this.title = 'Urgent Fundraising',
    required this.fundraiseData,
  });

  @override
  Widget build(BuildContext context) {
    // print("I am here 78787779866789");
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBarHead(title),
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
                    inputType: TextInputType.none,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: GetBuilder<GetController>(
                builder: (controller) {
                   
                  return ListView.separated(
                    separatorBuilder: (context, index) => Styles.KHeight10,
                    itemCount: fundraiseData.length,
                    
                    itemBuilder: (context, index) {
                      //  final data=page=='urgent'? data_control.urgentFundrise[index]:page=='end'? data_control.endingFundrise[index]:controller.publishedFundriseAll[index];
                    
                     if (fundraiseData.isEmpty) {
                    return CircularProgressIndicator(); 
                  } else {
                      return main_childCard(
                        data: fundraiseData[index],
                      );
                  }
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
