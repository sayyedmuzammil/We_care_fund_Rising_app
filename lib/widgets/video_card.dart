
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';

// ignore: camel_case_types
class video_card extends StatelessWidget {
  const video_card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 60.w,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
       // shrinkWrap: true,
       itemCount: 8,
       itemBuilder: (context, index) {
         return  Container(
      margin: const EdgeInsets.only( left: 20 ),
      alignment: Alignment.topLeft, 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.topCenter,
          width: 45.w, 
          height: 60.w,
          color: Styles.primary_black_light,
          child: Column(
     children: [
       Stack(
         children: [
           //  KWidth20,

           SizedBox(
             width: 45.w, 
             height: 60.w,  
             child: FittedBox(
                 fit: BoxFit.fitHeight,
                 child:
                     Image.asset('assets/images/shelter_video_bg.jpg')), 
           ),
           
           Column(
             children: [
               SizedBox(height: 29.w,),   
               Center(child: Icon(Icons.play_circle_outline, color: Styles.primary_green,size: 4.h,)),
               SizedBox(height: 10.w,), 
             Container(
               alignment: Alignment.bottomLeft, 
               width: 40.w,   
               child: Text(
                     "Susan's Shelter was Successfull",
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis, 
                     style: Styles.RegularText.copyWith(
                         color: Colors.white,
                         fontWeight: FontWeight.bold),
                   ),
             )
             ],

           )
         ],
       ),
     
     ],
          ),
        ),
      ),
    );
       },
     ),
          );
  }
}
