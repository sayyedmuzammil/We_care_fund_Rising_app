import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';

class Interest extends StatelessWidget {
  const Interest({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Styles.primary_black, 
        title: const Text("Select Your Interest",style: TextStyle(fontSize: 24, color: Colors.white), ), 
      leading:Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back, color: Styles.primary_green,),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ), ),
      backgroundColor: Styles.primary_black,
      body: Container(
        margin: EdgeInsets.all(20), 
        child: Column(
          
          children:  [
            Text("Choose your interest to donate. Don't worry, you can always change it later.", style: TextStyle(color: Colors.white, fontSize: 15),),
           Styles.KHeight20,
            Container(
              height: 70.h,
              child: GridView.count(  
                // shrinkWrap: true,
                crossAxisCount: 3,  
                
                crossAxisSpacing: 3.0,  
                mainAxisSpacing: 2.0,    
                children: List.generate(12, (index) {    
                  return Center(  
                    child: Container(height: 25.w, 
                    width: 25.w, color:Styles.primary_black_light,
                    child: Column(
                      children: const [
                       Styles.KHeight20, 
                       Icon(Icons.cast_for_education, size: 44, color:Styles.primary_green,),
                       Text("Education", style: TextStyle(color: Colors.white, fontSize: 14),)
                      ],
                    ),),   
                  );  
                }  
                )  
          ),
            )  
          ],
          ),
      )
    ); 
    
  }
}