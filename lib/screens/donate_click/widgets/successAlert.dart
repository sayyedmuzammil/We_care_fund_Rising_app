// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screen_main_page.dart';

class SuccessAlert extends StatelessWidget {
  bool success;
   SuccessAlert({Key? key, this.success=true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,  
      body: SizedBox(
        // height: 100.h, 
        child: Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)), 
                child: Container(
                  padding: const EdgeInsets.all(20),   
                  height: 50.h,
                  width: 80.w,
                  color: Styles.primary_black_light, 
                  
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    
                    children: [
                      Center(
                    child: Image.asset(success? 'assets/images/success icon final.png':'assets/images/cancel icon final.png', height: 55.w,  )),  
                    Text(success?'Successful!':'Failed!', style: Styles.Header.copyWith(color:success? Styles.primary_green:const Color(0xFFe53a5b)),), 
                    Styles.KHeight10, 
                        Text(
                    success?'Thank you for making a donation':'Payment Failed! Try again Later', 
                    style: Styles.RegularText.copyWith(color: Colors.white),
                  ),
                  Styles.KHeight20, 
                      TextButton( 
                      child: Container(
                        width: 100.w, 
                        alignment: Alignment.center, 
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Text(
                            'OK', 
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor:success? Styles.primary_green: const Color(0xFFe53a5b), 
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0)),
                        // side: const BorderSide(color: Styles.primary_green),
                      ),
                      onPressed: () async {
                          Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ScreenMainPage(indexGett: 1), 
                        ),
                      );
                      },
                ),
                    ],
                  ), 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
