import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant_design.dart';
import '../screens/donation_fundrise/new_fundrise/new_fundraising.dart';
import '../widgets/appBarHead.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({ Key? key }) : super(key: key);

  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Styles.primary_black,
      appBar: AppBarHead('Contact us'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
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
                    Styles.KHeight10, 
                    text_field(
                      Text_field_controller: _fullnameController,
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
                    Styles.KHeight10, 
                    text_field(
                      Text_field_controller: _fullnameController,
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
                          "Message",
                          style: Styles.RegularTextBold,
                        ),
                        Text(
                          "*",
                          style:
                              Styles.RegularTextBold.copyWith(color: Colors.red),
                        ),
                        Spacer(), 
                          Padding(
                            padding: const EdgeInsets.only(right: 20), 
                            child: Text(
                            "Max 250 words",
                            style:
                                Styles.RegularText.copyWith(color: Colors.white, fontSize: 12) 
                        ),
                          ),
                      ],
                    ),
                    Styles.KHeight10, 
                    text_field(
                    Text_field_controller: _messageController,
                    hintText: 'Message',
                    line_no: 5,
                  ),
          ],
        ),
      ),
         bottomNavigationBar:
         Padding(
           padding: const EdgeInsets.all(20.0), 
           child: Container(
             height: 14.w,    
             child: TextButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center, 
                                    children:const [
                                       Text(
                                        'Send Message',
                                        style: TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      Styles.KWidth10, 
                                      Icon(Icons.send, size: 16,), 
                                    ],
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
         /*  Container(
        decoration: BoxDecoration(
          color: Styles.primary_black,
          border: Border.all(
            width: .8,
            color: const Color(0xFF37424F),
          ),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        width: double.infinity,
        height: 20.w,
        child: Card(
            elevation: 10,
            color: Styles.primary_black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Styles.KWidth10,
                    // firstButton,
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 55.w,
                      height: 12.w,
                      child: /* data_control.approvalButton == false
                          ?  */TextButton(
                              child: const Text(
                                'Create & Submit',
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
                            )
                          /* : TextButton(
                              child: const Text(
                                'Publish',
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
                                //   // final res = await form_submitted(img!);
                                // }

                                Navigator.pop(context);
                              },
                            ), */
                    ),
                    Styles.KWidth10,
                  ],
                )
              ],
            )),
      ),
    */
    );
  }
}