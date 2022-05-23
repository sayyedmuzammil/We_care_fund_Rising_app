import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constant_design.dart';
import 'widgets/main_card.dart';

class SeeResultScreen extends StatelessWidget {
   SeeResultScreen({ Key? key , this.data}) : super(key: key);
final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black, 
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Styles.primary_black,
      title:  Text(
      'See Results',  
        style:const TextStyle(
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
      actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/images/menu_button.svg")),
          const SizedBox(
            width: 15,
          ),
        ],
    ),
    body: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20), 
      child: ListView(
        children: [
          //  donation_card(
          //                 data: data,
          //               // card_bottom:  card_bottom_fundrise(),
          //               bg_image: data.mainImage!,
          //             ), 
          Styles.KHeight20, 
          Divider(color: Colors.grey[800],),
          SizedBox(height: 30,), 
           Center(
             child: Text('Fundraising Results', style:const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
          
           ), 
           Styles.KHeight20, 
            SizedBox(
                height: 30.h,  
                child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 5,  
                    children: List.generate(6, (index) { 
                      return Center(
                        child: SizedBox(
                          
                          child: Container(
                            
                            decoration: BoxDecoration(
                              color: Styles.primary_black_light,
                              borderRadius: BorderRadius.circular(10),
                              // shape: BoxShape.circle
                          border: Border.all(
      color: Styles.primary_green,    
      width: 2, 
    ),
                            ),
                            height: 20.w, 
                            width: 25.w,
                            child: Column(
                              children: const [
                                Styles.KHeight10,
                                Text('₹87750', style:  TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 20, 
  )),  
  Styles.KHeight10, 
                                Text(
                                  "Funds gained", 
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ),
               Padding(
           padding: const EdgeInsets.only(top: 10),  
           child: Container(
             height: 11.w,    
             child: TextButton(
                                  child: const Text(
                                   'Withdraw Funds (₹87750)|| request pending',
                                   style: TextStyle(
                                       fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: Styles.primary_green,
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28.0)),
                                    side: const BorderSide(
                                        color: Styles.primary_green),
                                  ),
                                  onPressed: () async {
                                    // if (img != null) {
                                    //   final res = await form_submitted(img!);
                                    // }

                                    Navigator.pop(context);
                                  },
                                ),
           ),
         )
        ],
      ),
    ), 
    );
    
  }
}