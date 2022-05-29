// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:sizer/sizer.dart';
import 'package:we_care/db_functions/donators_model.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/razorpay.dart';
import 'package:we_care/screens/donate_click/widgets/successAlert.dart';
import 'package:we_care/widgets/appBarHead.dart';
import 'package:we_care/widgets/single_button.dart';
import '../../constant_design.dart';
import '../../db_functions/controller.dart';
import '../../db_functions/user_model.dart';

class PaymentScreen extends StatelessWidget {
  fundriseModel data;
  PaymentScreen({Key? key, required this.data}) : super(key: key);

//      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
// _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  final _amountController = TextEditingController();
  List<int> amount_list = [500, 1000, 2000, 3000, 5000, 10000];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primary_black,
      appBar: AppBarHead("Donate"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Enter the Amount',
                style: Styles.RegularTextBold,
              ),
              Styles.KHeight20,
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                color: Styles.primary_black_light,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Styles.primary_green,
                    fontSize: 44,
                  ),
                  controller: _amountController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      top: 35,
                      bottom: 32,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Styles.primary_green, width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: '₹0',
                    hintStyle: const TextStyle(
                      color: Styles.primary_green,
                      fontSize: 44,
                    ),
                  ),
                ),
              ),
              Styles.KHeight10,
              Divider(
                color: Colors.grey[800],
              ),
              Styles.KHeight10,
              Wrap(
                spacing: 10,
                children: [
                  amount_button(amount_list[0]),
                  amount_button(amount_list[1]),
                  amount_button(amount_list[2]),
                  amount_button(amount_list[3]),
                  amount_button(amount_list[4]),
                  amount_button(amount_list[5]),
                ],
              ),
              Styles.KHeight10,
              Divider(
                color: Colors.grey[500],
              ),

              Row(
                children: [
                  GetBuilder<GetController>(
                    builder: (controller) => Checkbox(
                      checkColor: Colors.white,
                      side: const BorderSide(
                        color: Styles.primary_green,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                      ),
                      fillColor:
                          MaterialStateProperty.all(Styles.primary_green),
                      value: data_control.anonymousCheck,
                      onChanged: (bool? val) {
                        data_control.anonymousCheck = val!;
                        data_control.update();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                    // height: 5.w,
                    child: const FittedBox(
                        child: Text(
                      "Donate as anonymous",
                      maxLines: 1,
                      style: Styles.RegularTextBold,
                    )),
                  ),
                ],
              ),
              Styles.KHeight10,
              TextButton(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Styles.primary_green,
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0)),
                  side: const BorderSide(color: Styles.primary_green),
                ),
                onPressed: () async {
                  int futRisedAmount = (data.fundriseAmount!) +
                      int.parse(_amountController.text);
                  int balanceAmount =
                      data.totalRequireAmount! - data.fundriseAmount!;

                  if (data.totalRequireAmount! > futRisedAmount) {
                    await RazorpayPayment(
                            fundriseData: data,
                            amount: _amountController.text.trim())
                        .onPay(data_control.user!);

                    // Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.",
                    // buttons: single_button('hello')).show();
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: successAlert(),
                      ),
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      "Only $balanceAmount is Needed",
                      animationDuration: Duration(milliseconds: 500),
                      duration: Duration(seconds: 1),
                      icon: Icon(
                        Icons.error,
                        size: 36,
                        color: Colors.black,
                      ),
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.blueAccent.withOpacity(1),
                      colorText: Colors.white,
                    );
                  }

                  // Navigator.pop(context);
                },
              ),
              // single_button(title: '')
            ],
          ),
        ),
      ),
    );
  }

  SizedBox amount_button(amount) {
    return SizedBox(
      width: 26.w,
      child: TextButton(
        child: Text(
          '₹$amount',
          style: const TextStyle(fontSize: 16),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Styles.primary_black,
          primary: Styles.primary_green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          side: const BorderSide(color: Styles.primary_green),
        ),
        onPressed: () {
          _amountController.text = amount.toString();
        },
      ),
    );
  }
}

donationSuccess(String fundRiseId, String fundRiseUserId, String amount) {
  final donationDb = FirebaseFirestore.instance;
  final data = DonatorsModel(
      fundRiseId: fundRiseId,
      fundRiseUserID: fundRiseUserId,
      date: DateTime.now().toString(),
      amount: int.parse(amount),
      isAnonymous: data_control.anonymousCheck);
  donationDb
      .collection("donationDb")
      .doc(data_control.user!.userId!)
      .collection('donation')
      .add(data.toMap())
      .then((value) {
    //  Navigaor
  });
}

addAmount(int oldFundriseAmount, int amount, String fundriseId,
    int oldDontorsCount) async {
  final total = oldFundriseAmount + amount;
  final donationDb = FirebaseFirestore.instance;
  final data = await donationDb
      .collection('fundrise')
      .doc(fundriseId)
      .update({"fundriseAmount": total, "donatorsCount": oldDontorsCount++});
}
