// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/settings/contactUs.dart';
import 'package:we_care/settings/faq.dart';
import 'package:we_care/settings/settings.dart';
import 'package:we_care/widgets/appBarHead.dart';

class ScreenHelp extends StatelessWidget {
  const ScreenHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBarHead("Help"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: SocialMediaButton("Instagram",
                            "assets/images/settings_Icons/instagram.png")),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {},
                        child: SocialMediaButton("Twitter",
                            "assets/images/settings_Icons/twitter.png")),
                  ],
                ),
                Styles.KHeight20,
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: SocialMediaButton("Website",
                            "assets/images/settings_Icons/earth-globe.png")),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SocialMediaButton("YouTube",
                          "assets/images/settings_Icons/youtube.png"),
                    ),
                  ],
                ),
                Styles.KHeight20,
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: FaqScreen(),
                        ),
                      );
                    },
                    child: Optional_buttons(Icons.person_rounded, "FAQ")),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ContactUsScreen(),
                        ),
                      );
                    },
                    child:
                        Optional_buttons(Icons.person_rounded, "Contact us")),
                GestureDetector(
                    onTap: () {},
                    child: Optional_buttons(
                        Icons.person_rounded, "Terms & Conditions")),
                GestureDetector(
                    onTap: () {},
                    child: Optional_buttons(
                        Icons.person_rounded, "Privacy Policy")),
                GestureDetector(
                    onTap: () {},
                    child: Optional_buttons(Icons.person_rounded, "About Us")),
                SizedBox(
                  height: 10.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center SocialMediaButton(title, imageicon) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Styles.primary_green,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 31.w,
        width: 42.w,
        child: Column(
          children: [
            Styles.KHeight20,
            Styles.KHeight10,
            ImageIcon(
              AssetImage(imageicon),
              size: 38,
              color: Colors.white,
            ),
            Styles.KHeight10,
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
