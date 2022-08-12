import 'package:flutter/material.dart';

enum ChatMessageType{text} 
enum MessageStatus{not_sent,not_view, viewed} 

class ChatMessage {
  final String text;
  final bool isSender;
  final MessageStatus;
  // final String MessageStatus;
  ChatMessage({
    required this.text,
    required this.isSender, 
    required this.MessageStatus
    // required this.MessageStatus, 
  });
}
List demoChatMessages=[
  ChatMessage(text: "Hello test", 
  isSender: false,  
  MessageStatus: MessageStatus.viewed
  ), 
  ChatMessage(text: "Error happened kdmf jkm flhdlfbd dfk hdfmdnf kgdh nfjkn",   
  isSender: true, 
  MessageStatus: MessageStatus.viewed, 
  ), 
    ChatMessage(text: "happy to see",  
  isSender: true, 
  MessageStatus: MessageStatus.not_sent, 
  ), 
  ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
  ChatMessage(text: "Glad you like it", isSender: true, 
  MessageStatus: MessageStatus.not_view 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
ChatMessage(text: "Error happened kdmf jkm flhdlfbd dfk hdfmdnf kgdh nfjkn",   
  isSender: false,  
  MessageStatus: MessageStatus.viewed, 
  ), 
    ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
  ChatMessage(text: "Glad you like it", isSender: true, 
  MessageStatus: MessageStatus.not_view 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
ChatMessage(text: "Error happened kdmf jkm flhdlfbd dfk hdfmdnf kgdh nfjkn",   
  isSender: false,  
  MessageStatus: MessageStatus.viewed, 
  ),  
    ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
  ChatMessage(text: "Glad you like it", isSender: true, 
  MessageStatus: MessageStatus.not_view 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
ChatMessage(text: "Error happened kdmf jkm flhdlfbd dfk hdfmdnf kgdh nfjkn",   
  isSender: false,  
  MessageStatus: MessageStatus.viewed, 
  ), 
    ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
  ChatMessage(text: "Glad you like it", isSender: true, 
  MessageStatus: MessageStatus.not_view 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
   ChatMessage(text: "This looks great!", 
  isSender: false,
  MessageStatus: MessageStatus.viewed, 
  ), 
ChatMessage(text: "Error happened kdmf jkm flhdlfbd dfk hdfmdnf kgdh nfjkn",   
  isSender: false,  
  MessageStatus: MessageStatus.viewed, 
  ), 

]; 
