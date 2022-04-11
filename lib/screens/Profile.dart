// ignore_for_file: must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.primary_black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Styles.primary_black,
          title: const Text(
            "Profile",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset("assets/images/main_logo.svg"),
                ));
          }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/images/settings_icon.svg")),
            const SizedBox(
                // width: 15,
                ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/images/menu_button.svg")),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Styles.KHeight10,
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/profile_avatar.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          print("edit avatar");
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Styles.primary_green,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Styles.KHeight20,
              const Text(
                "Adam Smith",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Styles.KHeight20,
              SizedBox(
                height: 8.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Text(
                          "12",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Fundraising",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: double.infinity,
                      width: .5,
                      color: Colors.grey[800],
                    ),
                    Column(
                      children: const [
                        Text(
                          "17",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Donation",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Styles.KHeight20,
              Container(
                width: double.infinity,
                height: .5,
                color: Colors.grey[800],
              ),
              Styles.KHeight20,
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "About",
                  style: Styles.Header, 
                ),
              ),
              Styles.KHeight10,
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, wordSpacing: 1.4),
              ),
              Styles.KHeight10,
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    const Text(
                      "Interest",
                      style: Styles.Header, 
                    ),
                    IconButton(
                      onPressed: () {
                        print("edit interest");
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Styles.primary_green,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                spacing: 15,
                // alignment: WrapAlignment.spaceBetween,
                children: [
                  my_intersests_button(
                    interest: 'Medical',
                  ),
                  my_intersests_button(
                    interest: 'Disaster',
                  ),
                  my_intersests_button(
                    interest: 'Education',
                  ),
                  my_intersests_button(
                    interest: 'Social',
                  ),
                  my_intersests_button(
                    interest: 'Orphanage',
                  ),
                  my_intersests_button(
                    interest: 'Humanity',
                  ),
                  my_intersests_button(
                    interest: 'Environment',
                  ),
                ],
              ),
            ],
          ),
        )));
  }

 Widget my_intersests_button({required String interest}) {
     return TextButton(
      child: Text(
        interest,
        style: const TextStyle(fontSize: 16),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Styles.primary_black,
        primary: Styles.primary_green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        side: const BorderSide(color: Styles.primary_green),
      ),
      onPressed: () {},
    );
  }
}
