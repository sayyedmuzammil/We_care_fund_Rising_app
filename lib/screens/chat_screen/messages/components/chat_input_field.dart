import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant_design.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
    required TextEditingController chatController,
  })  : _chatController = chatController,
        super(key: key);

  final TextEditingController _chatController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1.w,
      left: 1.w,
      child: SizedBox(
        height: 15.w,
        width: 100.w,
        // color: Colors.white,
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
                onPressed: () {
                  // socketConnecting();
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
