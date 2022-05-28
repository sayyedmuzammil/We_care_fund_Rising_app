import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screen_main_page.dart';
import 'package:we_care/screens/signup_signin/screenWelcome.dart';
import 'package:we_care/widgets/single_button.dart';

class successAlert extends StatelessWidget {
  const successAlert({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black.withOpacity(.4),   
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
           
          children: [
            SizedBox(
              height: 50.h,
              width: 80.w, 
              child: TextButton(
          child: Text(
            'Success',
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
              
                 Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRightWithFade,    
                    child:  ScreenMainPage(), 
                  ),
                );
            
             
            // data_control.categoryButtonClicked.value = currentIndex;
            
          },
        ),
            )
          ],
        ),
      ),
      
    );
  }
}