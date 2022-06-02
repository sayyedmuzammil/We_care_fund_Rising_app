// ignore_for_file: avoid_print, camel_case_types, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/extras/screen_phone.dart';

import 'Screen_signup.dart';

class ScreenWelcome extends StatelessWidget {
  const ScreenWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.primary_black,
        body: ListView(
          children: [
            const Image(image: AssetImage('assets/images/welcomescreen.png')),
            Center(
                child: Text(
              "Sign-in using",
              style: Styles.Header.copyWith(fontSize: 24),
            )),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  verification_Logo_button(
                    title: 'Phone number',
                    imageIcon: 'assets/images/phone_icon.svg',
                  ),
                  verification_Logo_button(
                    title: 'Google',
                    imageIcon: 'assets/images/google_icon.svg',
                  ),
                  verification_Logo_button(
                    title: 'Facebook',
                    imageIcon: 'assets/images/fb_icon.svg',
                  ),
                  Styles.KHeight10,
                  const Text(
                    'or',
                    style: Styles.Header,
                  ),
                  Styles.KHeight20,
                  SizedBox(
                    height: 13.w,
                    width: 90.w,
                    child: TextButton(
                      child: const Text(
                        'Sign in with Email',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Styles.primary_green,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0)),
                        side: const BorderSide(color: Styles.primary_green),
                      ),
                      onPressed: () {
                        data_control.signUp.value = false;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()),
                        );
                      },
                    ),
                  ),
                  Styles.KHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Styles.RegularText.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()),
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: Styles.RegularTextBold.copyWith(
                                color: Styles.primary_green),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class verification_Logo_button extends StatelessWidget {
  String title;
  String imageIcon;
  verification_Logo_button({
    required this.title,
    required this.imageIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const PhoneAuthentication(), 
                          ),
                        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        height: 18.w,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Styles.primary_green_light),
          color: Styles.primary_black_light,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                imageIcon,
                height: 30,
              ),
              Styles.KWidth10,
              Text(
                title,
                style: Styles.RegularTextBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
