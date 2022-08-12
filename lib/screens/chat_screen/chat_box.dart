import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sizer/sizer.dart';
import 'package:we_care/constant_design.dart';
import 'package:we_care/screens/chat_screen/Chat.dart';
import 'package:we_care/screens/chat_screen/messages/models/ChatMessage.dart';
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
                ChatMessage _singleMessage = demoChatMessages[index];
            
                if (_checkSamePerson == _singleMessage.isSender) {
                  _checkRepeat = true;
                } else {
                  _checkRepeat = false;
                  _checkSamePerson = _singleMessage.isSender;
                }
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
