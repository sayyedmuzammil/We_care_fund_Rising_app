import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/widgets/appBarHead.dart';
import 'package:we_care/widgets/textField.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatBox extends StatelessWidget {
   ChatBox({ Key? key }) : super(key: key);
  IO.Socket socket = IO.io('http://localhost:3000');

  @override
  Widget build(BuildContext context) {
    final _chatController = TextEditingController();
    return Scaffold(
      appBar: AppBarHead('ChatBox'),
      backgroundColor: Styles.primary_black, 
      body: Stack(
        children: [
           Positioned(
             bottom: 2.w, 
             left: 1.w,
            child: SizedBox(
              height: 15.w,
              width: 100.w, 
              // color: Colors.white, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,  
                children: [
                  SizedBox(
                    width: 85.w ,  
                    child: text_field(Text_field_controller: _chatController, )), 
                  IconButton(onPressed: (){
socketConnecting();

                  }, icon: Icon(Icons.send, color: Colors.green, size: 32,)),  
                ],
              ),
            ),
          )
        ],
      ),
    ); 
  }
  socketConnecting() {
    print('Entered to the socket function =====================');

    socket =
        IO.io("https://bb09-49-205-137-234.in.ngrok.io/", <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    // walletChangingBackend();
    print(" the socket connection is $socket");
  }

  // walletChangingBackend() {
  //   socket.on("updateCustomerWallet", (data) {
  //     print("++++++++++++++++++++++++++$data");
  //     paytmController.getHistoryDetailes();
  //   });
  // }

  acceptOrder(bookID, driverId, context) async {
    socket.emit("acceptOrder", {"driverId": driverId, "bookingId": bookID});
    // await orderConfirmed(context);
  }

  // orderConfirmed(context) async {
  //   var id = await IdStoring.getId();
  //   log("+++++++++++++++++++++++++++++++ Enterd to orderReady Function");
  //   socket.on("orderReady", (data) {
  //     // print(data);
  //     customerId = data["customer"];
  //     if (id == customerId) {
  //       log("customer id and this id is ok $id");
  //       orderData = data["forCustomer"];
  //       update();
  //       log("+++++++++++++++++++++ orderAcceted data $orderData");
  //        assigningVisibility(true);
  //       Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: (context) => OrderBottomNav()));
  //       return orderData;
  //     }
  //   });
  // }

//   bookingOrder(bookingId) {
//     log("+++++++++ENTERED TO CALL SOCKET ");
//     socket.emit("placeOrder", {"bookingId": bookingId});
//    driverPickupReached(bookingId);
//    assigningVisibility(true);
//   }

//   cancelOrder(orderId, reason) {
//     log("++++++++++++++Entered to Cancel Order socket Function");
//     try {
//   socket.emit("cancelOrder", {"bookingId": orderId, "reason": reason});
// } on Exception catch (e) {
//    print(e.toString());}
//   }


  // driverPickupReached(bookingId){
  //   socket.on("updateBooking", (data) => {
  //    if(bookingId == data["_id"]){
  //      assigningVisibility(false),
  //    },
  //     update()
  //   });

  // }
}