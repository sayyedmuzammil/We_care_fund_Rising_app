import 'package:flutter/material.dart';
import 'package:we_care/screens/chat_screen/messages/components/text_message.dart';

import '../../../../constant_design.dart';
import '../models/ChatMessage.dart';
import 'chat_message_dot.dart';

class Messsage extends StatelessWidget {
  const Messsage({Key? key, required this.message, required this.isSamePerson})
      : super(key: key);

  final ChatMessage message;
  final bool isSamePerson;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            isSamePerson
                ? const SizedBox(
                    width: 30,
                  )
                : const CircleAvatar(
                    radius: 12,
                    backgroundImage:
                        AssetImage('assets/images/Anonymous_Avatar.png'),
                  )
          ],
          Styles.KWidth10,
          TextMessage(
            isSamePerson: isSamePerson,
            message: message,
          ),
          isSamePerson
              ? const SizedBox(
                  width: 8,
                )
              : Container(),
          if (message.isSender) MessageStatusDot(status: message.MessageStatus)
        ],
      ),
    );
  }
}
