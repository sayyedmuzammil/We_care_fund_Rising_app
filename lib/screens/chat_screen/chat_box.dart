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
    ChatMessage _check = demoChatMessages[0];
    bool _checkSamePerson = !_check.isSender;
    bool _checkRepeat;
    return Scaffold(
      appBar: AppBarHead('ChatBox'),
      backgroundColor: Styles.primary_black,
      body: Stack(
        children: [ 
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: ListView.builder(
              
              // shrinkWrap: true,  
              controller: _controller, 
              physics: _physics,
              itemBuilder: (context, index) {

            

              ///Checking same sender
                ChatMessage _singleMessage = demoChatMessages[index];
            
                if (_checkSamePerson == _singleMessage.isSender) {
                  _checkRepeat = true;
                } else {
                  _checkRepeat = false;
                  _checkSamePerson = _singleMessage.isSender;
                }

                    // Checking same date
                   bool isSameDate = true;
              
              final DateTime date = demoChatMessages[index].date;
              final item = demoChatMessages[index];
              if (index == 0) {
                isSameDate = false;
              } else {
                final DateTime prevDate = demoChatMessages[index - 1].date;
                isSameDate = date.isSameDate(prevDate);
              }

              //building message
              if (index == 0 || !(isSameDate)) {

                return Column(
                  children: [
                    Center(child: Card(
                      margin: EdgeInsets.only(top: 10), 
                      color: Styles.primary_green_light,
          child: Padding(padding: const EdgeInsets.all(8), 
          child: Text(DateFormat.yMMMd().format(demoChatMessages[index].date), style: const TextStyle(color: Colors.white),),
          ),
          ),), 
                    Messsage(
                      isSamePerson: _checkRepeat,
                      message: demoChatMessages[index],
                    ), 
                    index==demoChatMessages.length-1?
                    SizedBox(height: 70,):Container(), 
                  ],
                );
              }
              else{
                return Column(
                  children: [

                    Messsage(
                      isSamePerson: _checkRepeat,
                      message: demoChatMessages[index],
                    ), 
                    index==demoChatMessages.length-1?
                    SizedBox(height: 70,):Container(), 
                  ],
                );
              }
                
              },
              itemCount: demoChatMessages.length,
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
  
   String formatDate() {
     final formatter = DateFormat(dateFormatter);
      return formatter.format(this);
  }
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    return now.difference(this).inDays;
  }
}