import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/new_fundraising.dart';
import 'package:we_care/screens/donation_fundrise/widgets/card_bottom_donation.dart';
import 'package:we_care/widgets/category_buttons.dart';

import '../constant_design.dart';
import '../db_functions/auth_method.dart';
import '../db_functions/controller.dart';
import '../db_functions/firebase.dart';
import '../db_functions/fundRiseModel.dart';
import '../screens/donation_fundrise/fund_rising.dart';
import '../screens/donation_fundrise/widgets/main_card.dart';
import '../screens/signup_signin/screenWelcome.dart';
import '../screens/urgentFundraising.dart';
import '../widgets/single_button.dart';

class Home_page_admin extends StatelessWidget {
  const Home_page_admin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "WeCare",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: ()  {
                // await AuthMethods().signOut();
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => ScreenWelcome(),
                //   ),
                //   (route) => false,
                // );
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset("assets/images/main_logo.svg"),
              ));
        }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UrgentFundraising(
                              title: 'Search',
                            )));
              },
              icon: SvgPicture.asset("assets/images/search_svg.svg")),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/noti_svg.svg")),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/bookmark_svg.svg")),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
     body: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5), 
       child: Column(
         children: [
           Expanded(
             child:
              //  Text("hello"),
                 StreamBuilder<List<fundriseModel>>(
              stream:    getFundrise(), 
              builder: (context, snapshot) {
                
               
               if(snapshot.data != null){
                return  ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final data=snapshot.data![index];
                  // print("${snapshot.data![index].status}");

                    return SizedBox(
                      height: 56.w, 
                      child: donation_card(
                        data:  data,
              card_bottom: TextButton(
          child: Text(
            'Review',
            style: const TextStyle(fontSize: 16),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Styles.primary_black,
            primary:  Styles.primary_green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            side: const BorderSide(color: Styles.primary_green),
          ),
          onPressed: () { 
            data_control.approvalButton.value=true;
            data_control.update();
       Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => newFundrising(firstButton:  draft_or_cancel_button('Cancel', Icon(Icons.cancel,),Colors.red),)));
          },
        ),
              // bg_image: data.mainImage!,
            ),
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
         ],
       ),
     ),
    );
  }
}