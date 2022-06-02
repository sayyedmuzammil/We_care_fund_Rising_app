import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';
import 'package:we_care/screens/donate_click/payment_screen.dart';

import '../screens/donate_click/widgets/successAlert.dart';

class RazorpayPayment {
  FundriseModel fundriseData;
  String amount;
  BuildContext context;
  RazorpayPayment({
    required this.context,
    required this.fundriseData,
    required this.amount,
  });
  final Razorpay _razorpay = Razorpay();

  onPay(userModel data) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    var options = {
      'key': 'rzp_test_6hKFuGbRrXGWWi',
      'amount': int.parse(amount) * 100,
      'name': data.name,
      // 'description': 'Fine T-Shirt',
      'prefill': {'contact': data.phoneNumber, 'email': data.email}
    };
    _razorpay.open(options);
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) async {
    donationSuccess(fundriseData.fundraiseId!, fundriseData.userId!, amount);
    final res = await addAmount(fundriseData.fundriseAmount!, int.parse(amount),
        fundriseData.fundraiseId!, fundriseData.donatorsCount!);
    if (res == true) {
      Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  SuccessAlert(),
                  ),
                  (route) => false,
                );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  SuccessAlert(success: false,),
                  ),
                  (route) => false,
                );
    // failure page design
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}
