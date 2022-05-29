import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:we_care/controller/myDonationController.dart';
import 'package:we_care/db_functions/fundRiseModel.dart';
import 'package:we_care/db_functions/user_model.dart';
import 'package:we_care/screens/donate_click/payment_screen.dart';

class RazorpayPayment {
  final MyDonationController _myDonationController = Get.find();
  fundriseModel fundriseData;
  String amount;
  RazorpayPayment({
   required this.fundriseData,
   required this.amount, 
  });
Razorpay _razorpay = Razorpay();


   onPay(userModel data){
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
   
    var options = { 
  'key': 'rzp_test_6hKFuGbRrXGWWi',
  'amount': int.parse(amount)*100, 
  'name': data.name,
  // 'description': 'Fine T-Shirt',
  'prefill': {
    'contact': data.phoneNumber,
    'email': data.email
  }
};
 _razorpay.open(options);
 
  }
  
 _handlePaymentSuccess(PaymentSuccessResponse response) {
     donationSuccess(fundriseData.fundraiseId!, fundriseData.userId!, amount);
  addAmount(fundriseData.fundriseAmount!, int.parse(amount), fundriseData.fundraiseId!, fundriseData.donatorsCount!);
 }
void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails

  // failure page design
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet was selected
}
  
    
}
