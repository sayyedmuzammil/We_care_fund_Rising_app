// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/donation_fundrise/new_fundrise/new_fundraising.dart';
import 'package:we_care/screens/signup_signin/screen_yourInterest.dart';

class FillProfile extends StatelessWidget {
  FillProfile({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneControler = TextEditingController();
  final _genderController = TextEditingController();
  final _cityController = TextEditingController();
  final _aboutController = TextEditingController();
  final _globalKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "Fill Your Profile",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Styles.primary_green,
                  )));
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Styles.KHeight20,
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
            Form(
              key: _globalKey2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Styles.KWidth20,
                      const Text(
                        "Full Name",
                        style: Styles.RegularTextBold,
                      ),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _nameController,
                    hintText: 'Full Name',
                  ),
                  Styles.KHeight20,
                  Row(
                    children: [
                      Styles.KWidth20,
                      const Text(
                        "Email",
                        style: Styles.RegularTextBold,
                      ),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _emailController,
                    hintText: 'Email',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Styles.KHeight20,
                  Row(
                    children: [
                      Styles.KWidth20,
                      const Text(
                        "Phone Number",
                        style: Styles.RegularTextBold,
                      ),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _phoneControler,
                    hintText: 'Phone Number',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Styles.KHeight20,
                  Row(
                    children: [
                      Styles.KWidth20,
                      const Text(
                        "Gender",
                        style: Styles.RegularTextBold,
                      ),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _genderController,
                    hintText: 'Gender',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Styles.KHeight20,
                  Row(
                    children: [
                      Styles.KWidth20,
                      const Text(
                        "City",
                        style: Styles.RegularTextBold,
                      ),
                      Text(
                        "*",
                        style:
                            Styles.RegularTextBold.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _cityController,
                    hintText: 'city',
                    isVisible: true,
                    suffix_icon: const Icon(
                      Icons.person_pin_circle_outlined,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                  Styles.KHeight20,
                  Row(
                    children: const [
                      Styles.KWidth20,
                      Text(
                        "About",
                        style: Styles.RegularTextBold,
                      ),
                    ],
                  ),
                  text_field(
                    Text_field_controller: _aboutController,
                    hintText: 'About',
                  ),
                  Styles.KHeight20,
                  Styles.KHeight10,
                  SizedBox(
                    height: 13.w,
                    width: 100.w,
                    child: TextButton(
                      child: const Text(
                        'Continue',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InterestScreen()),
                        );
                      },
                    ),
                  ),
                  Styles.KHeight20,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
