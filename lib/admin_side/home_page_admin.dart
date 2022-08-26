// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/controller/dataController.dart';
import '../constant_design.dart';
import '../db_functions/auth_method.dart';
import '../db_functions/firebase.dart';
import '../db_functions/fundRiseModel.dart';
import '../screens/donation_fundrise/widgets/main_card.dart';
import '../screens/signup_signin/screenWelcome.dart';
import '../screens/urgentFundraising.dart';
import 'reviewFundrise/fundrise_request.dart';

class Home_page_admin extends StatelessWidget {
  const Home_page_admin({Key? key}) : super(key: key);

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
              onPressed: () async {
                await AuthMethods().signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ScreenWelcome(),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UrgentFundraising(
                              title: 'Search',
                              fundraiseData: data_control.publishedFundriseAll,
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
                  StreamBuilder<List<FundriseModel>>(
                      stream: getFundrise(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final data = snapshot.data![index];
                              return SizedBox(
                                height: 56.w,
                                child: donation_card(
                                  data: data,
                                  card_bottom: TextButton(
                                    child: const Text(
                                      'Review',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Styles.primary_black,
                                      primary: Styles.primary_green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      side: const BorderSide(
                                          color: Styles.primary_green),
                                    ),
                                    onPressed: () {
                                      // data_control.approvalButton.value = true;
                                      // data_control.update();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FundRise_request(data: data,)));
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text("No data"));
                        }
                      }),
            ),
          ],
        ),
      ),
    );
  }
}
