import 'package:flutter/material.dart';

import '../../../../constant_design.dart';
import '../models/chat_message.dart';

class MessageStatusDot extends StatelessWidget {
  final MessageStatus status;
  const MessageStatusDot({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return Colors.red;
        case MessageStatus.not_view:
          return Styles.primary_green_light;
        case MessageStatus.viewed:
          return Styles.primary_green.withOpacity(.8);
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 12,
      width: 12,
      decoration:
          BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Colors.white,
      ),
    );
  }
}
