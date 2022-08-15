// ignore_for_file: avoid_print, camel_case_types, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors, unused_field, prefer_const_constructors, unrelated_type_equality_checks, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/auth_method.dart';
import 'package:we_care/controller/dataController.dart';
import 'package:we_care/screen_main_page.dart';
import 'package:we_care/screens/signup_signin/screen_fill_profile.dart';

import '../../admin_side/admin_main_sscren.dart';
import '../../widgets/textField.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _globalKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Styles.primary_black,
        body: ListView(
          children: [
            SizedBox(
              height: 27.h,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/images/WeCareMainLogo.png')],
                ),
              ),
            ),
            Center(
                child: Obx(() => Text(
                      data_control.signUp == true
                          ? 'Sign up for free'
                          : 'Sign in to your account',
                      style: Styles.Header.copyWith(fontSize: 24),
                    ))),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Form(
                      key: _globalKey1,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Styles.KWidth20,
                                const Text(
                                  "Email",
                                  style: Styles.RegularTextBold,
                                ),
                                Text(
                                  "*",
                                  style: Styles.RegularTextBold.copyWith(
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            text_field(
                              Text_field_controller: _emailController,
                              hintText: 'Email',
                            ),
                            Styles.KHeight10,
                            Row(
                              children: [
                                Styles.KWidth20,
                                const Text(
                                  "Password",
                                  style: Styles.RegularTextBold,
                                ),
                                Text(
                                  "*",
                                  style: Styles.RegularTextBold.copyWith(
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            text_field(
                              isPassword: true,
                              Text_field_controller: _passwordController,
                              hintText: 'Password',
                              isVisible: true,
                              suffix_icon: const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ),
                          ])),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            checkColor: Colors.white,
                            side: const BorderSide(
                              color: Styles.primary_green,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                            ),
                            fillColor:
                                MaterialStateProperty.all(Styles.primary_green),
                            value: data_control.RememberCheck.value,
                            onChanged: (bool? val) {
                              data_control.RememberCheck.value = val!;
                              data_control.update();
                            },
                          )),
                      SizedBox(
                        width: 20.w,
                        child: const FittedBox(
                            child: Text(
                          "Remember me",
                          maxLines: 2,
                          style: Styles.RegularTextBold,
                        )),
                      ),
                    ],
                  ),
                  Styles.KHeight10,
                  SizedBox(
                    height: 13.w,
                    width: 90.w,
                    child: TextButton(
                        child: Obx(() => Text(
                              data_control.signUp == true
                                  ? 'Sign up'
                                  : 'Sign in',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                        style: TextButton.styleFrom(
                          backgroundColor: Styles.primary_green,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0)),
                          side: const BorderSide(color: Styles.primary_green),
                        ),
                        onPressed: data_control.signUp == true
                            ? () async {
                                String res = await AuthMethods().signUpUser(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                print("this in login button $res");
                                data_control.profileImage = null;
                                if (res == 'success') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FillProfile(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    ),
                                  );
                                }
                              }
                            : () async {
                                String res = await AuthMethods().signInUser(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                print("777 res $res");
                                if (res == 'admin') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AdminScreenMain()),
                                  );
                                }
                                if (res == 'success') {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ScreenMainPage()),
                                  );
                                }
                              }),
                  ),
                  Obx(() => Column(
                        children: [
                          Styles.KHeight10,
                          Visibility(
                            visible: !data_control.signUp.value,
                            child: TextButton(
                                onPressed: () {
                                  print("forgot clicked");
                                },
                                child: Text(
                                  data_control.signUp == true
                                      ? ''
                                      : 'Forgot the password?',
                                  style: Styles.RegularTextBold.copyWith(
                                      color: Styles.primary_green),
                                )),
                          ),
                        ],
                      )),
                  Styles.KHeight10,
                  Text(
                    "or continue with",
                    style: Styles.RegularText.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Styles.KHeight20,
                  SizedBox(
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Logo_button_signUp(
                          imageIcon: 'assets/images/phone_icon.svg',
                        ),
                        Logo_button_signUp(
                          imageIcon: 'assets/images/google_icon.svg',
                        ),
                        Logo_button_signUp(
                          imageIcon: 'assets/images/fb_icon.svg',
                        ),
                      ],
                    ),
                  ),
                  Styles.KHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                            data_control.signUp == true
                                ? 'Already have an account?'
                                : "Don't have an account?",
                            style: Styles.RegularText.copyWith(
                              color: Colors.white,
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            data_control.signUp.value =
                                !data_control.signUp.value;
                            data_control.update();
                          },
                          child: Obx(() => Text(
                                data_control.signUp == true
                                    ? 'Sign in'
                                    : 'Sign up',
                                style: Styles.RegularTextBold.copyWith(
                                    color: Styles.primary_green),
                              )))
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class Logo_button_signUp extends StatelessWidget {
  String imageIcon;
  Logo_button_signUp({
    required this.imageIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 15.w,
        width: 15.w,
        decoration: BoxDecoration(
          border: Border.all(color: Styles.primary_green_light),
          color: Styles.primary_black_light,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageIcon,
              alignment: Alignment.center,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
