import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/chat_screen/Chat.dart';
import 'package:we_care/screens/chat_screen/messages/models/chat_message.dart';
import 'package:we_care/widgets/appBarHead.dart';
import 'package:we_care/widgets/textField.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'messages/components/chat_input_field.dart';
import 'messages/components/message.dart';
import 'messages/components/text_message.dart';

class ChatBox extends StatefulWidget {
  ChatBox({Key? key}) : super(key: key);

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  IO.Socket socket = IO.io('http://localhost:3000');

final _controller = ScrollController();

ScrollPhysics _physics = const ClampingScrollPhysics();

@override
void initState() {
  super.initState();
  _controller.addListener(() {
    if (_controller.position.pixels <= 56) {
      setState(() => _physics = const BouncingScrollPhysics());
    } else {
      setState(() => _physics = const BouncingScrollPhysics());
    }
  });
}

  @override
  Widget build(BuildContext context) {
    final _chatController = TextEditingController();
    
    return Scaffold(
      appBar: AppBarHead('ChatBox'),
      backgroundColor: Styles.primary_black,
      body: Stack(
        children: [ 
           Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,),
              child:  StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('messages').doc('T5A55Kp7DoedrCQd1wLLfs74RRE3').collection('chats').orderBy('date_fb',descending: false).snapshots(),
            builder: (context, AsyncSnapshot snapshot){
       
              if(snapshot.hasData){
                if(snapshot.data.docs.length<1){
                  return Center(
                    child: Text("Say Hi... "),
                  ); 

                }
                   else{
                        final _check = snapshot.data.docs[2]; 
    bool _checkSamePerson = !_check['isSender_fb'];
    bool _checkRepeat; 
       return ListView.builder(
                
                // shrinkWrap: true,  
                controller: _controller, 
                reverse: false,
                physics: _physics, 
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
          
              print("666 ${snapshot.data.docs.length-1}");
          
                ///Checking same sender
                  final _singleMessage = snapshot.data.docs[index];
              
                  if (_checkSamePerson == _singleMessage['isSender_fb']) {
                    _checkRepeat = true;
                  } else {
                    _checkRepeat = false;
                    _checkSamePerson = _singleMessage['isSender_fb'];
                  }
          
                      // Checking same date
                     bool isSameDate = true;
                
                final DateTime date =DateTime.parse(snapshot.data.docs[index]['date_fb']);
                // final item = snapshot.data.docs[index];
                if (index == 0) {
                  isSameDate = false;
                  print("6667 $isSameDate $_checkRepeat"); 
                } else {
                  final DateTime prevDate = DateTime.parse(snapshot.data.docs[index - 1]['date_fb']);
                  isSameDate = date.isSameDate(prevDate);
                  print("6666 $isSameDate $_checkRepeat"); 
                }
                
          
                //building message
                if (index == 0 || !(isSameDate)) {
                  
                  return Column(
                    children: [
                      Center(child: Card(
                        margin: EdgeInsets.only(top: 10), 
                        color: Styles.primary_green_light,
            child: Padding(padding: const EdgeInsets.all(8), 
            child: Text(DateFormat.yMMMd().format(DateTime.parse(snapshot.data.docs[index]['date_fb'])), style: const TextStyle(color: Colors.white),),
            ),
            ),), 
                      Messsage(
                        isSamePerson: _checkRepeat,
                        message: snapshot.data.docs[index],
                      ), 
                      index==snapshot.data.docs.length-1?
                      SizedBox(height: 70,):Container(), 
                    ],
                  );
                }
                else{
                  return Column(
                    children: [
          
                      Messsage(
                        isSamePerson: _checkRepeat,
                        message: snapshot.data.docs[index],
                      ), 
                      index==snapshot.data.docs.length-1?
                      SizedBox(height: 70,):Container(), 
                    ],
                  );
                }
                  
                },
                
              );
           
                   }
             
              }
              return Center(child: CircularProgressIndicator(),);
            },
          
          ),
              
           
            )),
          

          ChatInputField(chatController: _chatController),
          // Expanded(
          //     child: ListView.builder(
          //   itemCount: chatsData.length,
          //   itemBuilder: (context, index) => Text(
          //     'Test',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ))
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
  acceptOrder(bookID, driverId, context) async {
    socket.emit("acceptOrder", {"driverId": driverId, "bookingId": bookID});
    // await orderConfirmed(context);
  }
}


const String dateFormatter = 'MMMM dd, y';

extension DateHelper on DateTime {
  
  //  String formatDate() {
  //    final formatter = DateFormat(dateFormatter);
  //     return formatter.format(this);
  // }
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  // int getDifferenceInDaysWithNow() {
  //   final now = DateTime.now();
  //   return now.difference(this).inDays;
  // }
}