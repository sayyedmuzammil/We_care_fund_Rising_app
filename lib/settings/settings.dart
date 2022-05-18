// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:we_care/db_functions/controller.dart';
import 'package:we_care/screens/signup_signin/screen_fill_profile.dart';
import 'package:we_care/settings/help.dart';

import '../constant_design.dart';
import '../db_functions/auth_method.dart';
import '../screens/signup_signin/screenWelcome.dart';

class SettingsUser extends StatelessWidget {
  const SettingsUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black,
        title: const Text(
          "Settings",
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Styles.KHeight10,  
              GestureDetector(
                  onTap: () {print("edit profile clicked");

                  data_control.editProfile=true;
                  data_control.update();
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FillProfile(
                            
                            )));
                  },
                  child:
                      Optional_buttons(Icons.person_rounded, "Edit Profile")),
              GestureDetector(
                onTap: () {},
                child: Optional_buttons(Icons.notifications, "Notification"),
              ),
              GestureDetector( 
                onTap: () {},
                child: Optional_buttons(Icons.lock, "Security"),
              ),
              GestureDetector(
                onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:const ScreenHelp(),
                  ),
                );
                },
                child: Optional_buttons(Icons.info, "Help"),
              ),
              GestureDetector(
                onTap: () {},
                child: Optional_buttons(Icons.group, "Invite Freinds"),
              ),
               Divider(
                color: Colors.grey[800],
              ),
              Styles.KHeight10,
              InkWell(
                onTap: ()async {
                await AuthMethods().signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const ScreenWelcome(),
                  ),
                  (route) => false,
                );
              },
                child: Row(
                  children:const [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF2C161E),
                      child: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                    ),
                    Styles.KWidth20,
                    Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
               
               
              
                
            ],
          ),
        ),
      ),
    );
  }

}

  Column Optional_buttons(icon, title) {
    return Column(
      children: [
      Divider(color: Colors.grey[800],), 
        Styles.KHeight10,
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Styles.primary_green_light,
                child: Icon(
                  icon,
                  color: Styles.primary_green,
                ),
              ),
              Styles.KWidth20,
              Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Styles.primary_green,
                size: 14,
              )
            ],
          ),
        ),
        Styles.KHeight10, 
        
      ],
    );
  }