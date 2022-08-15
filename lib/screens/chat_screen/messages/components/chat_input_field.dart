// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant_design.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField(
      {Key? key,
      required TextEditingController chatController,
      required this.recieverId})
      : _chatController = chatController,
        super(key: key);

  final TextEditingController _chatController;
  final recieverId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1.w,
      left: 1.w,
      child: SizedBox(
        height: 15.w,
        width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Styles.primary_black_light,
                    borderRadius: BorderRadius.circular(40)),
                child: Expanded(
                    child: TextField(
                  controller: _chatController,
                  style: const TextStyle(color: Styles.primary_green),
                  decoration: const InputDecoration(
                    hintText: "Type message",
                    hoverColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                  ),
                )),
              ),
            ),
            IconButton(
                onPressed: () async {
                  String messageFromInput = _chatController.text;
                  _chatController.clear();
                  String _date = DateTime.now().toString();
                  
                  
                  //sender side message storing
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('messages')
                      .doc(recieverId)
                      .collection('chats')
                      .add({
                    "senderId": FirebaseAuth.instance.currentUser!.uid,
                    "receiverId": recieverId,
                    'text_fb': messageFromInput,
                    'type': 'text',
                    'status_fb': 'not_view',
                    'date_fb': _date,
                    'isSender_fb': true
                  }).then((value) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('messages')
                        .doc(recieverId)
                        .set({'last_msg': messageFromInput});
                  });

                  //Reciever side message storing
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(recieverId)
                      .collection('messages')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('chats')
                      .add({
                    "senderId": FirebaseAuth.instance.currentUser!.uid,
                    "receiverId": recieverId,
                    'text_fb': messageFromInput,
                    'type': 'text',
                    'status_fb': 'not_view',
                    'date_fb': _date,
                    'isSender_fb': false
                  }).then((value) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('messages')
                        .doc(recieverId)
                        .set({'last_msg': messageFromInput});
                  });
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.green,
                  size: 32,
                )),
          ],
        ),
      ),
    );
  }
}
