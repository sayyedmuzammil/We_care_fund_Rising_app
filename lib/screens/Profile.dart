// ignore_for_file: must_be_immutable, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/bottom_nav_bar.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/db_functions/user_model.dart';
import 'package:we_care/screen_main_page.dart';
import 'package:we_care/settings/settings.dart';

import '../db_functions/firebase.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // init();
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
                onPressed: () {
                  indexChangeNotifier.value = 0;
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ScreenMainPage(),
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
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child:const SettingsUser(),
                  ),
                );
                },
                icon: SvgPicture.asset("assets/images/settings_icon.svg")),
            const SizedBox(),
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
          child:  GetBuilder<GetController>(
            
          builder: (controller) =>  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.KHeight10,
              Center(
                child:Stack(
                  children: [
                    GetBuilder<GetController>(
            builder: (controller)  =>Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: data_control.profileImage != null
                                                        ? DecorationImage(
                                                            image: MemoryImage(
                                                                data_control.profileImage!),
                                                            //NetworkImage(image!),
                                                            fit: BoxFit.cover,
                                                          )
                                                        : DecorationImage(
                                                            image: NetworkImage(
                                                                data_control.user!.photoUrl.toString()),
                                                            fit: BoxFit.cover,
                                                          ))),
                                          ],
                                        ),),
                    // child:
                    // data_control.profileImage!=''?
                    // Image(image: MemoryImage(val!)) : Image(image: AssetImage('assets/images/profile_avatar.png'))
        
                    Positioned(
                      bottom: 0,
                      right: 130, 
                      child: InkWell(
                        onTap: () async {
                         var val=await pickImage();
                      //  print("unit $vall");
                           if (val.toString != 'null') {
                    // val=vall;
                    data_control.profileImage=val;
                     data_control.update();
                  }
                 
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
               Center(
                 child: Text(
                  data_control.user?.name.toString()??'Profile name',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
              ),
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
                child:  Text(
                  'About',
                  style: Styles.Header,
                ),
              ),
              Styles.KHeight10,
               Text(
                 data_control.user?.about??'About of user',
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

pickImage() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }
      // data_control.profileImage = await img.path.;
      // print(await data_control.profileImage);
     return await img.readAsBytes();
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }
}
