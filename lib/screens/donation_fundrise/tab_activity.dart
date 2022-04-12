import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';

 // ignore: non_constant_identifier_names
 tab_Activity(bg_image, dateFormated) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20), 
      child:
         Expanded(
           child: ListView.builder(
             
             itemCount: 10,
             itemBuilder: (context, index) {
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start, 
               children: [
                Text(dateFormated, style: Styles.RegularText.copyWith(color: Colors.white),), 
                 Padding(
               padding: const EdgeInsets.only(bottom: 15,),
               child: Column( 
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
            Styles.KHeight10,
            Container(
              height: 20.w,    
              width: double.infinity,    
              decoration: BoxDecoration(
                   border: Border.all(color: Styles.primary_green_light),  
                color: Styles.primary_black_light,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Styles.KWidth10,   
                  const CircleAvatar(backgroundColor: Styles.primary_black,radius: 25, 
                  backgroundImage: AssetImage('assets/images/profile_avatar.png'), ),
                  Styles.KWidth20, 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    mainAxisAlignment: MainAxisAlignment.center,  
                    children: [
                    const Text('Anonymous', style: Styles.RegularTextBold,),
                    const SizedBox(height: 5,), 
                    Row(
                      children: [
                        Text('has donated ', style: Styles.RegularText.copyWith(color: Colors.white),),
                        Text('₹250', style: Styles.RegularText.copyWith(fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],),
                ],
              ),
            ),
                 ],
               ),
             ),
             ],);
           },),
         )
     
    );
  }